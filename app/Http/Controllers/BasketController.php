<?php

namespace App\Http\Controllers;

use Hash;
use Mail;
use App\Product;
use App\ProductType;
use App\Basket;
use App\User;
use App\Role;
use App\Address;
use App\Order;
use App\Region;
use App\BasketInfo;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class BasketController extends Controller
{
    public function userSessionStart()
    {
        //session_start();
        if (!isset($_SESSION['basket']['count'])) {
            $_SESSION['basket'] = array(
                'count' => 0,
                'products' => array(
                    'id' => array(),
                    'count' => array(),
                ),
            );
        }
    }
    //basket page
    public function basket()
    {   
        $this->userSessionStart();
        $models = array();
        $summaryCostOfProducts = 0.00;

        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['count'][$key] > 0) {
                $models[$key] = Product::getById($_SESSION['basket']['products']['id'][$key])[0];
                $models[$key]->count = $_SESSION['basket']['products']['count'][$key];
                $summaryCostOfProducts += $models[$key]->count*Product::getPriceById($_SESSION['basket']['products']['id'][$key]);
            }
        }
        
        return view('basket.list', [
            "userProducts"  => $models, 
            //"allQueries"    => $QueryRequest,
            "sumCost"       => $summaryCostOfProducts
        ]);
    }

    public function store() 
    {

        $summaryCostOfProducts = 0.00;
        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['count'][$key] > 0) {
                $models[$key] = Product::getById($_SESSION['basket']['products']['id'][$key])[0];
                $models[$key]->count = $_SESSION['basket']['products']['count'][$key];
                $summaryCostOfProducts += $models[$key]->count*Product::getPriceById($_SESSION['basket']['products']['id'][$key]);
            }
        }
        if ($summaryCostOfProducts == 0.00)
            return $this->basket();

        return view('basket.make_order', [
            "userProducts"  => $models, 
            "sumCost"       => $summaryCostOfProducts
        ]);

    }

    public function makeOrder() 
    {
        
        $date = new \DateTime();

        //generate random pass
        $length = 8;
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $count = mb_strlen($chars);

        for ($i = 0, $pass = ''; $i < $length; $i++) {
            $index = rand(0, $count - 1);
            $pass .= mb_substr($chars, $index, 1);
        }
        $hashedPass = Hash::make($pass);

        if (\Auth::check()) {
            $userId = \Auth::id();
            $email = User::getEmailById($userId);
        } else {
            $validator = Validator::make($_POST, [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'phone_number' => 'required|regex:/(380)[0-9]{9}/',
            ]);
            if($validator->fails()) {
                dd(1);
                return Redirect::back()->withErrors(['msg', 'Validation contact form error']);
            } else {
                $userId = User::insertNonRegisterUser($_POST['name'], $_POST['email'], $_POST['phone_number'], $hashedPass, $date->format('Y-m-d H:i:s'));
                $email = $_POST['email'];
            }
        }
        $date = new \DateTime();
        $addressId = Address::insert($userId, $_POST['country'], $_POST['region'], $_POST['city'], $_POST['postcode'], $date->format('Y-m-d H:i:s'));
        $orderId = Order::insert($userId, $addressId, 1, $date->format('Y-m-d H:i:s'));
        $products = json_decode($_POST['products']);
        $summaryPrice = 0.00;
        foreach ($products as $key => $product) {
            $cost = Product::getPriceById($product->id);
            $summaryPrice += $cost;
            BasketInfo::insert($orderId, $product->id, $product->count, $cost);
        }
        $this->sendOrderEmail($email, $summaryPrice, $pass, $date->format('Y-m-d H:i:s'));
        $this->delete();
        return view('Payment.ThankYou');
    }
	// functions for session basket
    public function addOne()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);

        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['id'][$key] == $productId) {
                ++$_SESSION['basket']['products']['count'][$key];
                return redirect()->back();
            }
        }

        $_SESSION['basket']['products']['id'][++$_SESSION['basket']['count']] = $productId;
        $_SESSION['basket']['products']['count'][$_SESSION['basket']['count']] = 1;
        
        return redirect()->back();
    }

    public function deleteAllById()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);
        foreach ($_SESSION['basket']['products'] as $key => $value) {
            if ($value == $productId){
                $value = 0;
            }
        }
        return redirect()->back();
    }

    public function deleteOne()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);
        //dd($productId); die();
        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['id'][$key] == $productId) {
                $_SESSION['basket']['products']['count'][$key] = max($_SESSION['basket']['products']['count'][$key] - 1, 0);
                return redirect()->back();
            }
        }
        return view('error.404');
    }

    public function delete()
    {
        $models = $_SESSION['basket'] = array(
            'count' => 0,
            'products' => array(
                'id' => array(),
                'count' => array(),
            ),
        );
        return redirect()->back();
    }
}
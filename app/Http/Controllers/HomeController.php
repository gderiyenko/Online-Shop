<?php

namespace App\Http\Controllers;

use App\Product;
use App\ProductType;
use App\Basket;
use Illuminate\Support\Facades\Session;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        session_start();
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home');
    }
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

    public function list()
    {
        $ProductRequest = Product::getAllWithTypes();
        $ProductTypeRequest = ProductType::getAllTypes();
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"All"]);
    }

    public function listByType($productTypeName)
    {
        $ProductRequest = Product::getByType($productTypeName);
        $ProductTypeRequest = ProductType::getAllTypes();
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>$productTypeName]);
    }
    
    public function listSale()
    {
        $ProductRequest = Product::getSales();
        $ProductTypeRequest = ProductType::getAllTypes();
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"Sale"]);
    }

    public function addOne()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);

        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['id'][$key] == $productId) {
                ++$_SESSION['basket']['products']['count'][$key];
                return;
            }
        }

        $_SESSION['basket']['products']['id'][++$_SESSION['basket']['count']] = $productId;
        $_SESSION['basket']['products']['count'][$_SESSION['basket']['count']] = 1;
        
        return;
    }

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

    public function deleteAllById()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);
        foreach ($_SESSION['basket']['products'] as $key => $value) {
            if ($value == $productId){
                $value = 0;
            }
        }
        return;
    }

    public function deleteOne()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);
        //dd($productId); die();
        for ($key = 1; $key <= $_SESSION['basket']['count']; ++$key) {
            if ($_SESSION['basket']['products']['id'][$key] == $productId) {
                $_SESSION['basket']['products']['count'][$key] = max($_SESSION['basket']['products']['count'][$key] - 1, 0);
                return $this->basket();
            }
        }
        return view('error.404');
    }

    public function delete()
    {
        $models = $_SESSION['basket'] = array(
            'count' => 0,
            'products' => array(),
        );
        return view('basket.list', 
            [
                "userProducts"  => $models, 
                //"allQueries"    => $QueryRequest,
                "sumCost"       => $summaryCostOfProducts
            ]);
    }

}

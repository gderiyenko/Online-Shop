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
    // lists
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

    public function listByFind()
    {
        $findQuery = htmlspecialchars($_GET['findQuery']);
        $ProductRequest = Product::getByFind('*' . $findQuery . '*');
        $ProductTypeRequest = ProductType::getAllTypes();
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"Find"]);
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

    public function store() {

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

    public static function sendOrderEmail($email, $price, $pass, $orderTime)
    {
        Mail::send('emails.order', 
            [
                'order_time' => $orderTime, 
                'cost' => $price,
                'password' => $pass
            ],  
            function ($message) use ($email) {
                $message->from('us@example.com', 'Laravel');
                $message->to($email);
        });
    }

    public static function sendUpdateEmail($email, $newEmail, $pass)
    {
        Mail::send('emails.updateForOldEmail', 
            [
                'new_email' => $newEmail,
            ],  
            function ($message) use ($email) {
                $message->from('us@example.com', 'Laravel');
                $message->to($email);
        });return;
        Mail::send('emails.updateForNewEmail', 
            [
                'pass' => $pass,
            ],  
            function ($message) use ($newEmail) {
                $message->from('us@example.com', 'Laravel');
                $message->to($newEmail);
        });
    }

    public function makeOrder() {
        
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
                return;
            }
        }

        $_SESSION['basket']['products']['id'][++$_SESSION['basket']['count']] = $productId;
        $_SESSION['basket']['products']['count'][$_SESSION['basket']['count']] = 1;
        
        return;
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
            'products' => array(
                'id' => array(),
                'count' => array(),
            ),
        );
        return $this->basket();
    }

    // country-region-city
    public function findRegion()
    {
        $country = intval($_GET['country']);
        $result = Region::findRegionByCountry($country);

        echo '<select name="region" class="form-control" onchange="getCity(this.value)" style="height: 34px">';
        echo "<option>Select State</option>";
        foreach ($result as $key => $value)  { 
            echo "<option value=" . $result[$key]->id . ">" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }

    public function findCity()
    {
        $region = intval($_GET['region']);
        $result = Region::findCityByRegion($region);

        echo '<select name="city" class="form-control" style="height: 34px">';
        echo '<option>Select City</option>';
        foreach ($result as $key => $value)  { 
            echo "<option value=" . $result[$key]->id . ">" . $result[$key]->name . "</option>";
        } 
        echo "</select>";
    }

    // for admin
    public function adminUsers()
    {
        $users = User::getUsersForAdmin();
        return view('admin.users', [
            'users' => $users,
        ]);
    }

    public function editUser()
    {
        $userId = $_GET['id'];
        $user = User::getUserForAdmin($userId);
        $roles = Role::getAll();
        return view('admin.edit-user', [
            'user' => $user,
            'roles' => $roles,
        ]);
    }

    public function submitEditUser()
    {
        // if not valid request
        $validator = Validator::make($_POST, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.$_POST["user_id"],
            'phone_number' => 'required|regex:/(380)[0-9]{9}/|unique:users,phone_number,'.$_POST["user_id"],
        ]);
        if($validator->fails()){
            //return error
            return redirect()->back()
                            ->withErrors($validator);
        }

        $parameters = $_POST;
        if (isset($parameters["send_email"])) { // send email to user about update
            //generate random pass
            $length = 8;
            $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            $count = mb_strlen($chars);

            for ($i = 0, $pass = ''; $i < $length; $i++) {
                $index = rand(0, $count - 1);
                $pass .= mb_substr($chars, $index, 1);
            }
            $this->sendUpdateEmail(User::getEmailById($parameters["user_id"]), $parameters["email"], $pass);
        }
        // update user in database
        User::updateUser($parameters["user_id"], $parameters);
        return redirect()->back()->with('success', ['update was success']);  
    }

}

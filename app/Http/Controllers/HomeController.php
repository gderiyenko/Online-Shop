<?php

namespace App\Http\Controllers;

use App\Product;
use App\ProductType;
use App\Basket;

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
        var_dump(session_status());
        if (session_status() == PHP_SESSION_NONE) {
            var_dump(session_status());
            session_start();
            $_SESSION['basket'] = array(
                'count' => 0,
                'products' => array(),
            );
        }
        
    }

    public function list()
    {
        //$this->userSessionStart();
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
    public function addOne()
    {
        $json = $_GET['data'];
        $productId = json_decode($json, true);
        $_SESSION['basket']['products'][++$_SESSION['basket']['count']] = $productId;
        return;
    }
    public function basket()
    {
        //$userId = \Auth::id();
        //$this->userSessionStart();
        //$QueryRequest = BookingQuery::getAllUserQueries($userId);
        $models = array();
        $summaryCostOfProducts = 0.00;
        foreach ($_SESSION['basket']['products'] as $key => $productId) {
            $summaryCostOfProducts += Product::getPriceById($productId);
            $models[$key] = Product::getById($productId)[0];
            $models[$key]->count = 1;
        }
        
        return view('basket.list', 
                [
                    "userProducts"  => $models, 
                    //"allQueries"    => $QueryRequest,
                    "sumCost"       => $summaryCostOfProducts
                ]);
    }
}

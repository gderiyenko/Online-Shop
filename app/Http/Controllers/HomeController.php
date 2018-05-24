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
                'products' => array(),
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
        $_SESSION['basket']['products'][++$_SESSION['basket']['count']] = $productId;
        var_dump($_SESSION);
        return;
    }

    public function basket()
    {   
        Session::put('count', 0);
        $this->userSessionStart();
        $models = array();
        $summaryCostOfProducts = 0.00;
        foreach ($_SESSION['basket']['products'] as $key => $productId) if ($productId != 0){
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
        foreach ($_SESSION['basket']['products'] as $key => $value) { var_dump("1");
            if ($value == $productId){
                $_SESSION['basket']['products'][$key] = 0;
                break;
            }
        }
        return;
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

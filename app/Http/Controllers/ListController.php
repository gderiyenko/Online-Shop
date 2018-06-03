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

class ListController extends Controller
{
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
}

<?php

namespace App\Http\Controllers;

use Hash;
use Mail;
use Auth;
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
        if (User::isAdmin(Auth::id()))
            $admin = true;
        else
            $admin = false;
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"All", "admin"=>$admin]);
    }

    public function listByType($productTypeName)
    {
        $ProductRequest = Product::getByType($productTypeName);
        $ProductTypeRequest = ProductType::getAllTypes();
        if (User::isAdmin(Auth::id()))
            $admin = true;
        else
            $admin = false;
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>$productTypeName, "admin"=>$admin]);
    }
    
    public function listSale()
    {
        $ProductRequest = Product::getSales();
        $ProductTypeRequest = ProductType::getAllTypes();
        if (User::isAdmin(Auth::id()))
            $admin = true;
        else
            $admin = false;
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"Sale", "admin"=>$admin]);
    }

    public function listByFind()
    {
        $findQuery = htmlspecialchars($_GET['findQuery']);
        $ProductRequest = Product::getByFind('*' . $findQuery . '*');
        $ProductTypeRequest = ProductType::getAllTypes();
        if (User::isAdmin(Auth::id()))
            $admin = true;
        else
            $admin = false;
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"Find", "admin"=>$admin]);
    }
    public function listForOne()
    {
        $productId = htmlspecialchars($_GET['id']);
        $ProductRequest = Product::getById($productId);
        $ProductTypeRequest = ProductType::getAllTypes();
        if (User::isAdmin(Auth::id()))
            $admin = true;
        else
            $admin = false;
        return view('list', ["allProducts" => $ProductRequest, "allProductTypes"=>$ProductTypeRequest, "thisType"=>"Find", "admin"=>$admin]);
    }
}

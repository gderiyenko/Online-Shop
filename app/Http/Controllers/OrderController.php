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

class OrderController extends Controller
{
    public function list()
    {
        $orders = Order::getAllList(Auth::id());
        if (count($orders) == 0)
            return redirect()->back();
        foreach ($orders as $key => $order) {
            $Summary[$order->id] = 0.00;
            $products[$order->id] = BasketInfo::getByOrderId($order->id);
            foreach ($products[$order->id] as $key => $product) {
                $Summary[$order->id] += $product->cost * $product->count;
            }
        }//dd($orders, $products);
        return view('orders.list', [
            'orders' => $orders,
            'products' => $products,
            'sumCost' => $Summary,
        ]);
    }
}
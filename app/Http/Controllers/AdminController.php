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
use App\Status;
use App\Address;
use App\Order;
use App\Region;
use App\BasketInfo;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    // users
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
    // orders
    public function adminOrders()
    {
        $orders = Order::getOrdersForAdmin();
        return view('admin.orders', [
            'orders' => $orders,
        ]);
    }

    public function editOrder()
    {
        $orderId = $_GET['id'];
        $order = Order::getOrderForAdmin($orderId);
        $statuses = Status::getAll();

        return view('admin.edit-order', [
            'order' => $order,
            'statuses' => $statuses,
        ]);
    }

    public function submitEditOrder()
    {
        // if not valid request
        if ($_POST["status_id"] > 2 && $_POST["status_id"] < 6 && $_POST["consignment_number"]==""){
            $validator = Validator::make($_POST, [
                'consignment_number' => 'required',
            ]);
            if($validator->fails()){
                //return error
                return redirect()->back()
                                ->withErrors($validator);
            }
            //return redirect()->back()->with('errors', ['If basket was sent by post, consignment_number MUST be NOT NULL']);
        }
        $parameters = $_POST;
        if (isset($parameters["send_email"])) { // send email to user about update
            $this->sendUpdateOrderEmail();
        }
        // update user in database
        Order::updateOrder($parameters["order_id"], $parameters);
        return redirect()->back()->with('success', ['update was success']);  
    }

}
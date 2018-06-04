<?php

namespace App\Http\Controllers;

use Hash;
use Mail;
use Auth;
use Illuminate\Http\Request;
use App\Product;
use App\ProductType;
use App\Basket;
use App\User;
use App\Role;
use App\WeightType;
use App\Sale;
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

/* users */
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

/* orders */
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

/* sales */
    public function adminSales()
    {
        $sales = Sale::getSalesForAdmin();
        return view('admin.sales', [
            'sales' => $sales,
        ]);
    }

    public function addSale()
    {
        $product_id = $_GET['product_id'];
        $findSale = Sale::findActiveSaleForProduct($product_id);
        if ($findSale != null){
            return redirect('/admin/edit-sale?id='.$findSale);
        }
        $product = Product::getById($product_id)[0];
        return view('admin.add-sale', [
            'product' => $product,
        ]);
    }

    public function editSale()
    {
        $saleId = $_GET['id'];
        $sale = Sale::getSaleForAdmin($saleId);
        //dd($sale);
        return view('admin.edit-sale', [
            'sale' => $sale,
        ]);
    }

    public function submitEditSale()
    {
        $_POST["date_from"][10] = " ";
        $_POST["date_from"] .= ":00";
        $_POST["date_to"][10] = " ";
        $_POST["date_to"] .= ":00";

        $parameters = $_POST;
        // update sale in database
        Sale::updateSale($parameters["sale_id"], $parameters);
        return redirect()->back()->with('success', ['update was success']);  
    }

    public function submitAddSale()
    {
        $_POST["date_from"][10] = " ";
        $_POST["date_from"] .= ":00";
        $_POST["date_to"][10] = " ";
        $_POST["date_to"] .= ":00";

        $parameters = $_POST;
        // insert sale in database
        $newSaleId = Sale::insert($parameters);
        return redirect('/admin/edit-sale?id='.$newSaleId)->with('success', ['update was success']);  
    }

/* products */
    public function adminProducts()
    {
        $products = Product::getProductsForAdmin();
        return view('admin.products', [
            'products' => $products,
        ]);
    }

    public function editProduct()
    {
        $productId = $_GET['id'];
        $product = Product::getProductForAdmin($productId);
        $types = WeightType::getAll();

        return view('admin.edit-product', [
            'product' => $product,
            'types' => $types,
        ]);
    }

    public function submitEditProduct(Request $request)
    {
        $this->validate($request, [
          'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        $parameters = $_POST;
        dd($request['image']);
        // update user in database
        Product::updateProduct($parameters["product_id"], $parameters);
        return redirect()->back()->with('success', ['update was success']);  
    }


}
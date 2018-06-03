<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Mail;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function __construct()
    {
        session_start();
        //$this->middleware('auth');
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

    public static function sendOrderEmail($email, $price, $pass, $orderTime)
    {
    	/*
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
        */
    }

    public static function sendUpdateEmail($email, $newEmail, $pass)
    {
    	/*
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
        */
    }
}

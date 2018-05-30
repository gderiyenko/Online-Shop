<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Order extends Model
{
    public static function insert($userId, $addressId, $status, $date)
    {
        return \DB::table('orders')->insertGetId(array(
            'user_id' => $userId,
            'address_id' => $addressId,
            'status_id' => $status,
            'created_at' => $date
        ));
    }
	

}

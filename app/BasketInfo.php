<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class BasketInfo extends Model
{
    public static function insert($orderId, $productId, $count, $price)
    {
        return \DB::table('baskets_info')->insertGetId(array(
            'order_id' => $orderId,
            'product_id' => $productId,
            'count' => $count,
            'cost' => $price
        ));
    }

}

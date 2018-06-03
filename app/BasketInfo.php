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

    public static function getByOrderId($orderId)
    {
        return \DB::select(
            'SELECT bi.*, p.name, wt.name as weight_type, p.weight
            FROM baskets_info as bi, products as p, weight_types as wt
            WHERE bi.product_id = p.id 
                AND p.weight_type = wt.id
                AND bi.order_id = ?', [$orderId]);
    }

}

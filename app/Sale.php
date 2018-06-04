<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Sale extends Model
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

    public static function getSalesForAdmin()
    {
        return \DB::select(
            'SELECT s.*, p.name as product_name, p.price as product_price
            FROM sales as s, products as p
            WHERE s.product_id = p.id', []);
    }

    public static function getSaleForAdmin($sale_id)
    {
        return \DB::select(
            'SELECT s.*, p.name as product_name, p.price as product_price,
                    DATE_FORMAT(date_from, "%Y-%m-%dT%H:%i") as from_date,
                    DATE_FORMAT(date_to, "%Y-%m-%dT%H:%i") as to_date
            FROM sales as s, products as p
            WHERE s.product_id = p.id
                AND s.id = ?', [$sale_id])[0];
    }

    public static function findActiveSaleForProduct($product_id)
    {
        return \DB::select(
            'SELECT s.id
            FROM sales as s
            WHERE (NOW() BETWEEN s.date_from AND s.date_to)
                AND s.product_id = ?', [$product_id])[0]->id;
    }

    public static function getOrderForAdmin($order_id)
    {
        return \DB::select(
            'SELECT 
                o.*,
                bs.name as status,
                city.name as city, city.id as city_id,
                region.name as region, region.id as region_id,
                a.postcode,
                u.name as user_name
            FROM orders as o, baskets_statuses as bs, addresses as a, vd_city_lang as city, vd_region_lang as region, users as u
            WHERE o.status_id = bs.id 
                AND a.id = o.address_id
                AND a.city_id = city.id
                AND "en" = city.lang
                AND a.region_id = region.id
                AND "en" = region.lang
                AND u.id = o.user_id
                AND o.id = ?', [$order_id])[0];
    }

    public static function updateSale($sale_id, $parameters)
    {
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        \DB::update(
            "UPDATE sales 
            SET 
                date_from = '" . $parameters['date_from'] ."',
                date_to = '" . $parameters['date_to'] ."',
                price = '" . $parameters['price'] ."',
                updated_at = '" . $date . "'
            WHERE id = " . $parameters['sale_id'] . ";"
        );
    }

}

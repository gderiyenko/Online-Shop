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

    public static function getAllList($userId)
    {
        return \DB::select(
            'SELECT o.*, bs.name as status, city.name as city, region.name as region, a.postcode
            FROM orders as o, baskets_statuses as bs, addresses as a, vd_city_lang as city, vd_region_lang as region
            WHERE o.status_id = bs.id 
                AND a.id = o.address_id
                AND a.city_id = city.id
                AND "en" = city.lang
                AND a.region_id = region.id
                AND "en" = region.lang
                AND o.user_id = ?', [$userId]);
    }

    public static function getOrdersForAdmin()
    {
        return \DB::select(
            'SELECT o.*, bs.name as status, city.name as city, region.name as region, a.postcode, u.name as user_name
            FROM orders as o, baskets_statuses as bs, addresses as a, vd_city_lang as city, vd_region_lang as region, users as u
            WHERE o.status_id = bs.id 
                AND a.id = o.address_id
                AND a.city_id = city.id
                AND "en" = city.lang
                AND a.region_id = region.id
                AND "en" = region.lang
                AND u.id = o.user_id', []);
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

    public static function updateOrder($order_id, $parameters)
    {
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        \DB::update(
            "UPDATE addresses 
            SET 
                region_id = '" . $parameters['region'] ."',
                city_id = '" . $parameters['city'] ."',
                postcode = '" . $parameters['postcode'] ."',
                created_at = '" . $date . "'
            WHERE id = " . $parameters['address_id'] . ";"
        );
        \DB::update(
            "UPDATE orders 
            SET 
                status_id = '" . $parameters['status_id'] ."',
                consignment_number = '" . $parameters['consignment_number'] ."',
                updated_at = '" . $date . "'
            WHERE id = " . $parameters['order_id'] . ";"
        );
    }

}

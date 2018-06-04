<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;


class Sale extends Model
{
    public static function insert($parameters)
    {
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        return \DB::table('sales')->insertGetId(array(
            'product_id' => $parameters["product_id"],
            'price' => $parameters["price"],
            'date_from' => $parameters["date_from"],
            'date_to' => $parameters["date_to"],
            'created_by' => Auth::id(),
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
        $result = \DB::select(
            'SELECT s.id
            FROM sales as s
            WHERE (NOW() BETWEEN s.date_from AND s.date_to)
                AND s.product_id = ?', [$product_id]);
        if (count($result) == 0)
            return null;
        else
            return $result[0]->id;
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

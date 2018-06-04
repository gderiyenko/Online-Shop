<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
	public static function getAll()
	{
		return \DB::select('select * from products where ?', [1]);
	}

	public static function getAllWithTypes()
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))');
	}

	public static function getById($productId)
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE p.id = ?', [$productId]);
	}

	public static function getByType($typeName)
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE p.type_id = pt.id AND pt.name = ?', [$typeName]);
	}

	public static function getSales() 
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE s.price IS NOT NULL', []
		);
	}

	public static function getByFind($findName)
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE MATCH (p.name, p.description) AGAINST (?);', [$findName]
		);
	}

	public static function orderInfoById($id)
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			WHERE p.id = ?', [$id])[0];
	}

	public function shopId()
	{

		if (\Auth::user()->role_id == 1){
			return $this->belongsTo(Shop::class);
		}

		$communication = Communication::where("shop_admin_id", \Auth::user()->id)->get();
		return Shop::where("id", $communication[0]->shop_id)->get();
	}

	public function typeId()
	{
		return $this->belongsTo(ProductType::class);
	}

	public function weightType()
	{
		return $this->belongsTo(WeightType::class);
	}
	
	public static function getPriceById($x)
	{
		$priceInfo = \DB::select(
			'SELECT p.price, s.price sale_price
			FROM products p 
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE p.id = ?', [$x]
		);
		if ($priceInfo[0]->sale_price == 0)
			return $priceInfo[0]->price;
		else 
			return $priceInfo[0]->sale_price;
	}
	/* for admin*/
	public static function getProductsForAdmin()
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price, wt.name as weight_name
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			JOIN weight_types wt on p.weight_type = wt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))', []);
	}
	public static function getProductForAdmin($product_id)
	{
		return \DB::select(
			'SELECT p.*, pt.name as type_name, s.price as sale_price, wt.name as weight_name
			FROM products p
			JOIN product_types pt on p.type_id = pt.id
			JOIN weight_types wt on p.weight_type = wt.id
			LEFT JOIN sales s on (s.product_id = p.id AND (NOW() BETWEEN s.date_from AND s.date_to))
			WHERE p.id = ?', [$product_id])[0];
	}
	public static function updateProduct($product_id, $parameters)
    {
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        \DB::update(
            "UPDATE products
            SET 
                name = '" . $parameters['name'] ."',
                price = '" . $parameters['price'] ."',
                weight = '" . $parameters['weight'] ."',
                weight_type = '" . $parameters['weight_type'] ."',
                description = '" . $parameters['description'] ."',
                updated_at = '" . $date . "'
            WHERE id = " . $product_id . ";"
        );
    }
    public static function updateImage($product_id, $path)
    {
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        \DB::update(
            "UPDATE products
            SET 
                img = '" . $path ."',
                updated_at = '" . $date . "'
            WHERE id = " . $product_id . ";"
        );
    }
}

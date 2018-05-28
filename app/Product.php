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
			'SELECT 
			s.price as sale_price,
			s.date_to as sale_ends,
			p.*,
			pt.name as type_name
			FROM 
			sales s,
			products p,
			product_types pt
			WHERE
			s.product_id = p.id
			AND p.type_id = pt.id
			'
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

	public static function getByTemplate($templateId)
	{
		$temp = \DB::select('SELECT p.*, ti.count, pt.name as type_name FROM products p, template_infos ti, product_types pt WHERE (ti.product_id = p.id) AND (ti.template_id = ?) AND (pt.id = p.type_id);', [$templateId]);
		return $temp;
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
}

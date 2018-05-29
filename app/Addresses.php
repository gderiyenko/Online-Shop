<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Addresses extends Model
{
    public static function insert($userId, $countryId, $regionId, $cityId, $postcode)
    {
    	return \DB::insert(
            "INSERT INTO addresses (user_id, country_id, region_id, city_id, postcode, created_at) 
            VALUES (?,?,?,?,?,NOW())",
            [$userId, $countryId, $regionId, $cityId, $postcode]
        );
    }
    public static function findCityByRegion($regionId)
    {
    	return \DB::select(
    		'SELECT c.id, cl.`name`
			FROM vd_city c, vd_city_lang cl
			WHERE c.id = cl.id AND cl.lang="en" AND  c.region_id = ?;', [$regionId]);
    }
	

}

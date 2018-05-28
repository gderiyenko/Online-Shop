<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Region extends Model
{
    public static function findRegionByCountry($countryId)
    {
    	return \DB::select(
    		'SELECT r.id, rl.`name`
			FROM vd_region r, vd_region_lang rl
			WHERE r.id = rl.id AND rl.lang="en" AND  r.country_id = ?;', [$countryId]);
    }
    public static function findCityByRegion($regionId)
    {
    	return \DB::select(
    		'SELECT c.id, cl.`name`
			FROM vd_city c, vd_city_lang cl
			WHERE c.id = cl.id AND cl.lang="en" AND  c.region_id = ?;', [$regionId]);
    }
	

}

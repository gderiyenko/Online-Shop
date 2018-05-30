<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Address extends Model
{
    public static function insert($userId, $countryId, $regionId, $cityId, $postcode, $date)
    {
        return \DB::table('addresses')->insertGetId(array(
            'user_id' => $userId,
            'country_id' => $countryId,
            'region_id' => $regionId,
            'city_id' => $cityId,
            'postcode' => $postcode,
            'created_at' => $date
        ));
    }

}

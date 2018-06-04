<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class WeightType extends Model
{
    public static function getAll()
    {
        return \DB::select(
            'SELECT 
                wt.name, wt.id
            FROM weight_types as wt');
    }
	

}

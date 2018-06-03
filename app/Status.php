<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Status extends Model
{
    public static function getAll()
    {
        return \DB::select(
            'SELECT 
                s.name, s.id
            FROM baskets_statuses as s');
    }
	

}

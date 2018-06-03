<?php

namespace App;
use Illuminate\Database\Eloquent\Model;


class Role extends Model
{
    public static function getAll()
    {
        return \DB::select(
            'SELECT 
                r.name, r.id
            FROM roles as r');
    }
	

}

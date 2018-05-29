<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use DateTime;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'phone_number', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getRoleIdByUserId($userId)
    {
        return \DB::select('SELECT role_id from users where users.id = ?', [$userId]);
    }
    public function admin($userId)
    {
        echo $this->getRoleIdByUserId($userId);
        die();
    }
    public static function getContactInfoById($userId)
    {
        return \DB::select(
            'SELECT addresses.*
            FROM addresses
            WHERE addresses.user_id = ?
            Order by addresses.created_at DESC
            LIMIT 1 ', [$userId]);
    }
    public static function insertNonRegisterUser($name, $email, $phone)
    {
        //generate random pass
        $length = 8;
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $count = mb_strlen($chars);

        for ($i = 0, $result = ''; $i < $length; $i++) {
            $index = rand(0, $count - 1);
            $result .= mb_substr($chars, $index, 1);
        }

        $pass = $result;
        // make a new non register user  
        $date = new DateTime();
        return \DB::table('users')->insertGetId(array(
            'name' => $name,
            'email' => $email,
            'phone_number' => $phone,
            'password' => Hash::make($pass),
            'role_id' => 4,
            'avatar' => 'users/default.png',
            'created_at' => $date->format('Y-m-d H:i:s'),
            'updated_at' => $date->format('Y-m-d H:i:s')
        ));
    }


}

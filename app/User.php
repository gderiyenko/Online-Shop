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
    public static function getEmailById($userId)
    {
        return \DB::select(
            'SELECT email
            FROM users
            WHERE id = ?', [$userId]);
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
    public static function insertNonRegisterUser($name, $email, $phone, $hashedPass, $date)
    {
        // make a new non register user  
        return \DB::table('users')->insertGetId(array(
            'name' => $name,
            'email' => $email,
            'phone_number' => $phone,
            'password' => $hashedPass,
            'role_id' => 4,
            'avatar' => 'users/default.png',
            'created_at' => $date,
            'updated_at' => $date
        ));
    }


}

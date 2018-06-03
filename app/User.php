<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Auth;
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

    public static function getRoleIdByUserId($userId)
    {
        return \DB::select('SELECT role_id from users where users.id = ?', [$userId])[0]->role_id;
    }

    public static function isAdmin($userId)
    {
        if (User::getRoleIdByUserId($userId) == 1)
            return true;
        else
            return false;
    }

    public static function getEmailById($userId)
    {
        return \DB::select(
            'SELECT email
            FROM users
            WHERE id = ?', [$userId])[0]->email;
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

    public static function getUsersForAdmin()
    {
        return \DB::select(
            'SELECT 
                u.id, u.name, u.email, u.phone_number, u.created_at, u.updated_at,
                r.name as role
            FROM users as u, roles as r
            WHERE u.role_id = r.id
                AND u.id != ?', [Auth::id()]);
    }

    public static function getUserForAdmin($id)
    {
        if (Auth::id() == $id)
            return 0;

        return \DB::select(
            'SELECT 
                u.id, u.name, u.email, u.phone_number, u.created_at, u.updated_at,
                r.name as role
            FROM users as u, roles as r
            WHERE u.role_id = r.id
                AND u.id = ?', [$id])[0];
    }

    public static function updateUser($user_id, $parameters)
    {
        if (Auth::id() == $user_id)
            return 0;
        $date = new \DateTime();
        $date = $date->format('Y-m-d H:i:s');
        return \DB::update(
            "UPDATE users 
            SET 
                name = '" . $parameters['name'] ."',
                email = '" . $parameters['email'] ."',
                phone_number = '" . $parameters['phone_number'] ."',
                role_id = " . $parameters['role_id'] . ",
                updated_at = '" . $date . "'
            WHERE id = " . $user_id . ";"
        );
    }

}

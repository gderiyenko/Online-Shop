<?php

use App\User;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', 'HomeController@list');
Route::get('/list', 'HomeController@list');
Route::get('/list/sale', 'HomeController@listSale');
Route::get('/list/{name?}', 'HomeController@listByType');
Route::get('/list-find', 'HomeController@listByFind');

Route::get('/basket-add-one', 'HomeController@addOne');
Route::get('/basket', 'HomeController@basket');
Route::get('/basket-delete-one', 'HomeController@deleteOne');
Route::get('/basket-delete-all', 'HomeController@deleteAllById');
Route::get('/basket-delete', 'HomeController@delete');
Route::get('/basket-buy', 'HomeController@store');

Route::post('/make-order-request', 'HomeController@makeOrder');


Route::get('/find-region', 'HomeController@findRegion');
Route::get('/find-city', 'HomeController@findCity');


Route::view('/404', 'error.404');

Route::get('/home', function () {
    if (Auth::id() == 1) { // if admin
    	return redirect('/basket');
    } else {
		return redirect('/list');
    }
}); 

Route::prefix('admin')->group(function () {
    Route::get('users', 'HomeController@adminUsers');
    Route::get('edit-user', 'HomeController@editUser');
    Route::post('submit-edit-user', 'HomeController@submitEditUser');
});
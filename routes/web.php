<?php

use App\User;
use App\Http\Middleware\Role;
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

Route::get('/', 'ListController@list');
Route::get('/list', 'ListController@list');
Route::get('/list/sale', 'ListController@listSale');
Route::get('/list/{name?}', 'ListController@listByType');
Route::get('/list-find', 'ListController@listByFind');
Route::get('/product', 'ListController@listForOne');

Route::get('/basket-add-one', 'BasketController@addOne');
Route::get('/basket', 'BasketController@basket');
Route::get('/basket-delete-one', 'BasketController@deleteOne');
Route::get('/basket-delete-all', 'BasketController@deleteAllById');
Route::get('/basket-delete', 'BasketController@delete');
Route::get('/basket-buy', 'BasketController@store');
Route::post('/make-order-request', 'BasketController@makeOrder');

Route::get('/orders', 'OrderController@list')->middleware('auth');

Route::get('/find-region', 'LocationController@findRegion');
Route::get('/find-city', 'LocationController@findCity');

Route::view('/404', 'error.404');

Route::get('/home', function () {
    if (Auth::id() == 1) { // if admin
    	return redirect('/basket');
    } else {
		return redirect('/list');
    }
}); 

Route::get('/edit-region', 'LocationController@editRegion')->middleware('role');
Route::prefix('admin')->group(function () {
    Route::get('users', 'AdminController@adminUsers')->middleware('role');
    Route::get('edit-user', 'AdminController@editUser')->middleware('role');
    Route::post('submit-edit-user', 'AdminController@submitEditUser')->middleware('role');
    Route::get('orders', 'AdminController@adminOrders')->middleware('role');
    Route::get('edit-order', 'AdminController@editOrder')->middleware('role');
    Route::post('submit-edit-order', 'AdminController@submitEditOrder')->middleware('role');
    
	Route::get('/edit-city', 'LocationController@editCity')->middleware('role');
});
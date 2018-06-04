<?php

use App\User;
use App\Http\Middleware\Admin;
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

Route::get('/add-image',['as'=>'getimage','uses'=>'ImageController@getImage']);
Route::post('/add-image',['as'=>'postimage','uses'=>'ImageController@postImage']);

Route::get('/edit-region', 'LocationController@editRegion')->middleware('admin');
Route::prefix('admin')->group(function () {

    Route::get('users', 'AdminController@adminUsers')->middleware('admin');
    Route::get('edit-user', 'AdminController@editUser')->middleware('admin');
    Route::post('submit-edit-user', 'AdminController@submitEditUser')->middleware('admin');

    Route::get('orders', 'AdminController@adminOrders')->middleware('admin');
    Route::get('edit-order', 'AdminController@editOrder')->middleware('admin');
    Route::post('submit-edit-order', 'AdminController@submitEditOrder')->middleware('admin');

    Route::get('products', 'AdminController@adminProducts')->middleware('admin');
    Route::get('edit-product', 'AdminController@editProduct')->middleware('admin');
    Route::post('submit-edit-product', 'AdminController@submitEditProduct')->middleware('admin');

    Route::get('sales', 'AdminController@adminSales')->middleware('admin');
    Route::get('edit-sale', 'AdminController@editSale')->middleware('admin');
    Route::post('submit-edit-sale', 'AdminController@submitEditSale')->middleware('admin');
    Route::get('add-sale', 'AdminController@addSale')->middleware('admin');
    Route::post('submit-add-sale', 'AdminController@submitAddSale')->middleware('admin');
    
	Route::get('/edit-city', 'LocationController@editCity')->middleware('admin');
});
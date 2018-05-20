<?php
use Illuminate\Support\Facades\Auth;
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

//Route::get('/home', 'HomeController@list')->name('home');
Route::get('/', 'HomeController@list');
Route::get('/list', 'HomeController@list');
Route::get('/list/{name?}', 'HomeController@listByType');
Route::get('/basket-add-one', 'HomeController@addOne');
Route::get('/basket', 'HomeController@basket');
Route::get('/basket-delete-one', 'HomeController@deleteOne');
Route::get('/basket-delete-all', 'HomeController@deleteAllById');
Route::get('/basket-delete', 'HomeController@delete');
Route::get('/home', function () {
        if (Auth::id() == 1) { // if admin
        	return redirect('/basket');
        } else {
			return redirect('/list');
        }
}); 
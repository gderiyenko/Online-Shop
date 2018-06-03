<?php

namespace App\Http\Middleware;

use Closure;
use App\User;
use Auth;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!User::isAdmin(Auth::id())){
            return redirect('/404');
        }
        return $next($request);
    }
}

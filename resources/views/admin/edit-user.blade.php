@extends('layouts.app')

@section('content')
  
 @include('blocks.header')


<div class="page-container">

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
@if (\Session::has('success'))
    <div class="alert alert-success">
            {{\Session::get('success')[0]}}
    </div>
@endif
    <form role="form" method="POST" action="{{ url('/admin/submit-edit-user') }}">
    	{{ csrf_field() }}
    	<input type="hidden" class="form-control" name="user_id" value="{{$user->id}}">
    	<div class="form-group">
    		<label for="name">Name:</label>
    		<input type="text" class="form-control" name="name" value="{{$user->name}}">
    	</div>
    	<div class="form-group">
    		<label for="email">Email:</label>
    		<input type="email" class="form-control" name="email" value="{{$user->email}}">
    	</div>
    	<div class="form-group">
    		<label for="phone_number">Phone number:</label>
    		<input type="tel" class="form-control" name="phone_number" value="{{$user->phone_number}}">
    	</div>
    	<div class="form-group">
    		<label for="role_id">Role:</label>
    		@php
    			foreach($roles as $key => $role) 
    			if ($role->name != $user->role){
    		@endphp
    			<span>{{$role->name}}</span>
    			<input type="radio" name="role_id" value="{{$role->id}}">
    			<br>
    			@php
    		} else {
    		@endphp
    			<span>{{$role->name}}</span>
    			<input type="radio" name="role_id" value="{{$role->id}}" checked>
    			<br>
    		@php
    		}
    		@endphp
    	</div>
    	<div class="form-group">
    		<span> Send email about update to this user? </span>
    		<input type="checkbox" name="send_email" checked>
    	</div>
    	
    	
    	<input type="submit" value="Send Request">
    </form>
</div>

@endsection

@extends('layouts.app')

@section('content')
	@include('blocks.header')
	<div class="page-container">
	    <h1>
	        Thank You!
	    </h1>
	    <h3>
	        We've sent credentials to your email. <a href="/login">Log in</a> to see you order.
	    </h3>
	    
	</div>
@endsection

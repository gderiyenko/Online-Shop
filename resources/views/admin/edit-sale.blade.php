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
    <form role="form" method="POST" action="{{ url('/admin/submit-edit-sale') }}">
    	{{ csrf_field() }}
    	<input type="hidden" class="form-control" name="sale_id" value="{{$sale->id}}">
    	<div class="form-group">
    		<label for="product">Name:</label>
    		<input type="text" class="form-control" name="product_name" value="{{$sale->product_name}}" readonly>
    	</div>
        <div class="form-group">
            <label for="date_from">From:</label>
            <input type="datetime-local" class="form-control" name="date_from" value="{{$sale->from_date}}">
        </div>
        <div class="form-group">
            <label for="date_to">To:</label>
            <input type="datetime-local" class="form-control" name="date_to" value="{{$sale->to_date}}">
        </div>
        <div class="form-group">
            <label for="product_price">Product price:</label>
            <input type="number" class="form-control" name="product_price" value="{{$sale->product_price}}" readonly>
        </div>
        <div class="form-group">
            <label for="price">Sale price:</label>
            <input type="integer" class="form-control" name="price" value="{{$sale->price}}" >
        </div>
    	<input type="submit" value="Send Request">
    </form>
</div>

@endsection

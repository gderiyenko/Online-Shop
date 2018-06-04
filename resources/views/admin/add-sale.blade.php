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
    <form role="form" method="POST" action="{{ url('/admin/submit-add-sale') }}">
        {{ csrf_field() }}
        <input type="hidden" class="form-control" name="product_id" value="{{$product->id}}">
        <div class="form-group">
            <label for="product_name">Name:</label>
            <input type="text" class="form-control" name="product_name" value="{{$product->name}}" readonly>
        </div>
        <div class="form-group">
            <label for="date_from">From:</label>
            <input type="datetime-local" class="form-control" name="date_from">
        </div>
        <div class="form-group">
            <label for="date_to">To:</label>
            <input type="datetime-local" class="form-control" name="date_to">
        </div>
        <div class="form-group">
            <label for="product_price">Product price:</label>
            <input type="number" class="form-control" name="product_price" value="{{$product->price}}" readonly>
        </div>
        <div class="form-group">
            <label for="price">Sale price:</label>
            <input type="integer" class="form-control" name="price">
        </div>
        <input type="submit" value="Send Request">
    </form>
</div>

@endsection

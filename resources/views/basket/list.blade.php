<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script>
    function AddOne(productId) {
        $.get('/basket-add-one', {'data': productId}, function(response){ console.log(response); });
        window.location.reload();
    };
    function DeleteAll(productId) {
        $.get('/basket-delete-all', {'data': productId}, function(response){ console.log(response); });
        location.reload();
    };
    function DeleteBasket(TemplateName) {
        $.get('/basket-delete', {}, function(response){ console.log(response); });
        location.reload();
    };

    function BuyBasket() {
        window.location.replace('/basket-buy');
    };
</script>
@extends('layouts.app')

@section('content')
  
 @include('blocks.header')

<div class="page-container">

    
    <!-- product zone -->
    <div class="col-md-6">
<!-- BEGIN SAMPLE TABLE PORTLET-->
    <div class="portlet">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bell-o"></i>Advance Table </div>
        </div>
        <div class="portlet-body" style="">
            <div class="table-scrollable">
                <table class="table table-striped table-bordered table-advance table-hover">
                    <thead>
                        <tr>
                            <th>
                                <i class="fa fa-shopping-cart"></i> Product </th>
                            <th class="hidden-xs">
                                <i class="fa fa-user"></i> Count </th>
                            <th>
                                <i class="fa fa-money"></i> Total </th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($userProducts as $product)
                            @include('blocks.check')
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
        @php
            if (count($userProducts) == 0){
            	echo '<div class="info-card">';
            	echo '<p style=" margin: 10% 0 0 20%;"> There are nothing in the Basket... </p>';
            	echo '<a href="/list" ><p style=" margin: 15px 0 0 21%;">Back to shopping</p></a>';
            	echo '<br></div>';
        	}
        	else{ 
        @endphp
		    <hr>
		    <div class="info-card">
		    	<div class="right">
		    		<h2>Summary: @php echo number_format($sumCost , 2, '.', ''); @endphp usd. </h2>

		    	</div>
		    	<button class="btn cyan right bottom" title="Buy Basket" onclick ="BuyBasket()">
	            	<i class="material-icons">shopping_cart</i>
	            	Buy this Basket
	            </button>
		    </div>
	    @php 
            }
        @endphp

        <hr>
        
        <div class="info-card">
	        <div class="right bottom">
	        	<button class="btn black" title="Delete this Basket" onclick ="DeleteBasket()">
	            	<i class="material-icons">delete</i>
	            	Delete All
	            </button>
	        </div>
	    </div>
         @php
            $sumCost= $sumCost * 100;
        @endphp
   </div>
</div>
@endsection
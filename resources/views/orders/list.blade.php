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
                    <i class="fa fa-bell-o"></i>Orders </div>
            </div>
            @foreach ($orders as $order)
            <div class="portlet light bordered" >
                <h6>Status: {{$order->status}}</h6>
                <h6>Created at: {{$order->created_at}}</h6>
                <h6>Deliver to: Ukraine, {{$order->region}}, {{$order->city}}, {{$order->postcode}}</h6>
                <div class="portlet-body">
                    <div class="table-scrollable" style="display:inline;">
                        <table class="table table-striped table-bordered table-advance table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <i class="fa fa-shopping-cart"></i> Product </th>
                                    <th class="hidden-xs">
                                        <i class="fa fa-user"></i> Count </th>
                                    <th>
                                        <i class="fa fa-money"></i> Total </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products[$order->id] as $product)
                                    @include('blocks.ordersCheck')
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                <td></td>
                                <td></td>
                                <td>@php echo number_format($sumCost[$order->id] , 2, '.', ''); @endphp usd.</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
		<br>
    
</div>
@endsection
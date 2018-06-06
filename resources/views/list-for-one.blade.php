
<script>
    function AddOne(productId) {
        if ($.get('/basket-add-one', {'data': productId}, function(response){ console.log(response); }).done)
            showAddingAlert();
    };
    function findQuery() {
        var x = $('.findText').val();
        return $.get('/list-find', {'data': x}, function(response){ console.log(response); });
    };
</script>
@extends('layouts.app')

@section('content')

@include('blocks.header')


<div class="page-container">
    
    @include('blocks.sidebar')
    <!-- Zone -->
    <div class="page-content-wrapper">
        <div class="page-content" style="min-height: 1195px;">
                <!-- Find Form -->
                <form class="search-bar bordered page-breadcrumb breadcrumb" method="get" action="/list-find">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="input-group">
                                <input type="text" name="findQuery" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                                        <button class="btn blue uppercase bold" type="button submit">Search</button>
                                    </span>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <p class="search-desc clearfix"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur pellentesque auctor. Morbi lobortis, leo in tristique scelerisque. </p>
                        </div>
                    </div>
                </form>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="height:500; width: 500;">
                    <div class="portlet light portlet-fit bordered">
                        @if (!is_null($Product->sale_price))
                                    <div class="mt-element-ribbon" style="position:absolute; width: 160px; right: 10px; ">
                                        <div class="ribbon ribbon-vertical-right ribbon-color-warning uppercase ">
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                @endif
                        <div class="portlet-title">
                            <div class="caption">
                                <i class=" icon-layers font-green"></i>
                                <span class="caption-subject font-green bold uppercase">{{ $Product->name }}</span>
                                <div class="caption-desc font-grey-cascade"><pre class="mt-code">@php
                                        if (!is_null($Product->sale_price))
                                            echo number_format($Product->sale_price, 2, '.', '');
                                        else
                                            echo number_format($Product->price, 2, '.', '');
                                        @endphp</pre> for @php
                                        echo number_format($Product->weight, 2, '.', '');
                                        if ($Product->weight_type == 1)
                                            echo " liter";
                                        else
                                        if ($Product->weight_type == 2)
                                            echo " kg.";
                                        else
                                            echo " gr.";
                                    @endphp
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="mt-element-overlay" style="height:220;">
                                <div class="row">
                                    <div >
                                        <div class="mt-overlay-3 mt-overlay-3-icons">
                                            <img src="../assets/pages/img/page_general_search/{{$Product->img}}">
                                            <div class="mt-overlay">
                                                <h2>{{$Product->type_name}}</h2>
                                                <ul class="mt-info">
                                                    @if ($admin)
                                                    <li>
                                                        <a class="btn default btn-outline" href="/admin/add-sale?product_id={{$Product->id}}">
                                                            <i class="icon-star"></i>
                                                        </a>
                                                    </li>
                                                    @endif
                                                    <li>
                                                        <a class="btn default btn-outline" href="/product?id={{$Product->id}}">
                                                            <i class="icon-magnifier"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="btn default btn-outline" href="javascript:;" onclick ="AddOne({{$Product->id}})">
                                                            <i class="icon-plus"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h2>Description: </h2><h4>{{$Product->description}}</h4>
            </div>

            <!-- Products list -->
            <div class="row">
                @php
                    $incRaw=0;
                    foreach ($allProducts as $product){
                    ++$incRaw;
                    if ($incRaw==5){
                        $incRaw=1;
                        echo '</div><div class="row">';
                    }
                @endphp

                @include('blocks.product')
                                
                @php
                    }
                @endphp
            </div>
        </div>
    </div>

</div>
@include('blocks.alerts')

@endsection




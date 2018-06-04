
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




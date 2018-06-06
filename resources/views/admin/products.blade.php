@extends('layouts.app')

@section('content')
  
 @include('blocks.header')



<div class="page-container">
    <a href="/admin/add-product">Add</a>
    <table id="example" class="mdl-data-table" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Type</th>
                <th>Weigth</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
            @php
            foreach($products as $key => $product) {
            @endphp
            <tr>
                <td><a href="/product?id={{$product->id}}">{{$product->name}}</a></td>
                <td>{{$product->price}}</td>
                <td>{{$product->type_name}}</td>
                <td>{{$product->weight}} {{$product->weight_type_name}}</td>
                <td><a href="/admin/edit-product?id={{$product->id}}" class="btn btn-outline btn-circle btn-sm purple">
                    <i class="fa fa-edit"></i> Edit </a></td>
            </tr>
            @php
                }
            @endphp
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Type</th>
                <th>Weigth</th>
                <th>Edit</th>
            </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable( {
            columnDefs: [
                {
                    targets: [ 0, 1, 2 ],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        } );
    } );
</script>
@endsection

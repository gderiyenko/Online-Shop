@extends('layouts.app')

@section('content')
  
 @include('blocks.header')



<div class="page-container">
    <table id="example" class="mdl-data-table" style="width:100%">
        <thead>
            <tr>
                <th>Product name</th>
                <th>Price</th>
                <th>Sale Price</th>
                <th>From</th>
                <th>To</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
            @php
            foreach($sales as $key => $sale) {
            @endphp
            <tr>
                <td>{{$sale->product_name}}</td>
                <td>{{$sale->product_price}}</td>
                <td>{{$sale->price}}</td>
                <td>{{$sale->date_from}}</td>
                <td>{{$sale->date_to}}</td>
                <td><a href="/admin/edit-sale?id={{$sale->id}}" class="btn btn-outline btn-circle btn-sm purple">
            <i class="fa fa-edit"></i> Edit </a></td>
            </tr>
            @php
                }
            @endphp
        </tbody>
        <tfoot>
            <tr>
                <th>Product name</th>
                <th>Price</th>
                <th>Sale Price</th>
                <th>From</th>
                <th>To</th>
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


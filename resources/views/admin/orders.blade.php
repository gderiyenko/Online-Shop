@extends('layouts.app')

@section('content')
  
 @include('blocks.header')



<div class="page-container">
    <table id="example" class="mdl-data-table" style="width:100%">
        <thead>
            <tr>
                <th>User</th>
                <th>Address</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Status</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
            @php
            foreach($orders as $key => $order) {
            @endphp
            <tr>
                <td><a href="/admin/edit-user?id={{$order->user_id}}">{{$order->user_name}}</a></td>
                <td>Ukraine, {{$order->region}}, {{$order->city}}, {{$order->postcode}}</td>
                <td>{{$order->created_at}}</td>
                <td>{{$order->updated_at}}</td>
                <td>{{$order->status}}</td>
                <td><a href="/admin/edit-order?id={{$order->id}}" class="btn btn-outline btn-circle btn-sm purple">
            <i class="fa fa-edit"></i> Edit </a></td>
            </tr>
            @php
                }
            @endphp
        </tbody>
        <tfoot>
            <tr>
                <th>User</th>
                <th>Address</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Status</th>
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

@extends('layouts.app')

@section('content')
  
 @include('blocks.header')



<div class="page-container">
	<table id="example" class="mdl-data-table" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Role</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
        	@php
        	foreach($users as $key => $user) {
        	@endphp
        	<tr>
			    <td>{{$user->name}}</td>
			    <td>{{$user->email}}</td>
			    <td>{{$user->created_at}}</td>
			    <td>{{$user->updated_at}}</td>
			    <td>{{$user->role}}</td>
			    <td><a href="/admin/edit-user?id={{$user->id}}" class="btn btn-outline btn-circle btn-sm purple">
            <i class="fa fa-edit"></i> Edit </a></td>
			</tr>
			@php
        		}
        	@endphp
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
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

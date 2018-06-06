@extends('layouts.app')

@section('content')
  
 @include('blocks.header')



<div class="page-container">
    <table id="example" class="mdl-data-table" style="width:100%">
        <thead>
            <tr>
                <th>User</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            @php
            foreach($users as $key => $user) {
            @endphp
            <tr>
                <td>{{$user->name}}</td>
                <td>{{$user->kurs}}</td>
            </tr>
            @php
                }
            @endphp
        </tbody>
        <tfoot>
            <tr>
                <th>User</th>
                <th>Summary paid</th>
            </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable( {
            columnDefs: [
                {
                    targets: [ 0, 1],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        } );
    } );
</script>
@endsection

@extends('layouts.app')

@section('content')
  
 @include('blocks.header')

<script type="text/javascript">
    function getXMLHTTP() {
           var x = false;
           try {
              x = new XMLHttpRequest();
           }catch(e) {
             try {
                x = new ActiveXObject("Microsoft.XMLHTTP");
             }catch(ex) {
                try {
                    req = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1) {
                    x = false;
                }
             }
          }
          return x;
        }

    function getState(countryId) { 
        
        var strURL="/edit-region?country="+countryId;
      var req = getXMLHTTP();
      if (req) {console.log(1);
       req.onreadystatechange = function() {
        if (req.readyState == 4) {
         // only if "OK"
         if (req.status == 200) {      
          document.getElementById('statediv').innerHTML=req.responseText;
          document.getElementById('citydiv').innerHTML='<select name="city" class="form-control" style="height: 34px" required>'+
          '<option value="">Select City</option>'+'</select>';      
         } else {
          alert("Problem while using XMLHTTP:\n" + req.statusText);
         }
        }    
       }   
       req.open("GET", strURL, true);
       req.send(null);
      }  
    }

    function getCity(stateId) {  
      var strURL="edit-city?region="+stateId;
      var req = getXMLHTTP();
      
      if (req) {
       req.onreadystatechange = function() {
        if (req.readyState == 4) {
         // only if "OK"
         if (req.status == 200) {      
          document.getElementById('citydiv').innerHTML=req.responseText;      
         } else {
          alert("Problem while using XMLHTTP:\n" + req.statusText);
         }
        }    
       }   
       req.open("GET", strURL, true);
       req.send(null);
      }
        
    }
</script>

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
    <button onclick="getState(62)">Change address</button>
    <form role="form" method="POST" action="{{ url('/admin/submit-edit-order') }}">
    	{{ csrf_field() }}
        <input type="hidden" class="form-control" name="order_id" value="{{$order->id}}">
    	<input type="hidden" class="form-control" name="address_id" value="{{$order->address_id}}">
        
    	<div class="form-group">
            <select name="country" class="form-control"  style="height: 34px" required>
                <option value="62" selected>Ukraine</option>
            </select>
        </div>
        <div id="statediv" class="form-group">
            <select name="region" class="form-control" style="height: 34px" required>
                <option value="{{$order->region_id}}" selected">{{$order->region}}</option>
            </select>
        </div>
        <div id="citydiv" class="form-group">
            <select name="city" class="form-control" style="height: 34px" required>
                <option value="{{$order->city_id}}">{{$order->city}}</option>
            </select>
        </div>
        <div class="form-group">
            <div class="form-group">
                <input id="postcode" type="number" class="form-control" name="postcode" required placeholder="Postcode" value="{{$order->postcode}}">
            </div>
        </div>
        <div class="form-group">
            <div class="form-group">
                <input id="consignment_number" type="number" class="form-control" name="consignment_number" placeholder="consignment_number" value="{{$order->consignment_number}}">
            </div>
        </div>
    	<div class="form-group">
    		<label for="role_id">Status:</label>
    		@php
    			foreach($statuses as $key => $status) 
    			if ($status->name != $order->status){
    		@endphp
    			<span>{{$status->name}}</span>
    			<input type="radio" name="status_id" value="{{$status->id}}">
    			<br>
    			@php
    		} else {
    		@endphp
    			<span>{{$status->name}}</span>
    			<input type="radio" name="status_id" value="{{$status->id}}" checked>
    			<br>
    		@php
    		}
    		@endphp
    	</div>
    	<div class="form-group">
    		<span> Send email about update to order's owner? </span>
    		<input type="checkbox" name="send_email" checked>
    	</div>
    	
    	
    	<input type="submit" value="Send Request">
    </form>
</div>

@endsection

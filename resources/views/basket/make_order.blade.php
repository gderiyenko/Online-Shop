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
        $.get('/basket-delete', {'data': TemplateName}, function(response){ console.log(response); });
        location.reload();
    };

    function BuyBasket(TemplateName) {
        $.get('/basket-buy', {'data': TemplateName}, function(response){ console.log(response); });
        location.reload();
    };
</script>

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
        
        var strURL="/find-region?country="+countryId;
      var req = getXMLHTTP();
      if (req) {console.log(1);
       req.onreadystatechange = function() {
        if (req.readyState == 4) {
         // only if "OK"
         if (req.status == 200) {      
          document.getElementById('statediv').innerHTML=req.responseText;
          document.getElementById('citydiv').innerHTML='<select name="city">'+
          '<option>Select City</option>'+'</select>';      
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
      var strURL="find-city?region="+stateId;
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
                    <i class="fa fa-bell-o"></i>Check</div>
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
                                
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($userProducts as $product)
                                @include('blocks.check_short')
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
       
    <br>
    		
    
    <div class="col-md-6">
        <form method="post" action="/make-order-request" name="form1">
            {{ csrf_field() }}
            <input type="hidden" name="products" value="{{json_encode($userProducts)}}">
            <h2>Where to deliver?</h2>
            <div class="form-group">
                <select name="country" class="form-control" onChange="getState(this.value)" style="height: 34px">
                    <option>Select Country</option>
                    <option value="62">Ukraine</option>
                </select>
            </div>
            <div id="statediv" class="form-group">
                <select name="region" class="form-control" style="height: 34px">
                    <option>Select State</option>
                </select>
            </div>
            <div id="citydiv" class="form-group">
                <select name="city" class="form-control" style="height: 34px">
                    <option>Select City</option>
                </select>
            </div>
            <div class="form-group">
                <div class="form-group">
                        <input id="postcode" type="number" class="form-control" name="postcode" required placeholder="Postcode">
                </div>
            </div>
            <?php if (!\Auth::check()) { ?>
                <h2>How to contact you?</h2>
                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                        <input placeholder="Name" type="text" class="form-control" name="name" value="{{ old('name') }}" required>

                        @if ($errors->has('name'))
                            <span class="help-block">
                                <strong>{{ $errors->first('name') }}</strong>
                            </span>
                        @endif
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">

                            <input id="email" type="email" class="form-control" name="email" required placeholder="Email">

                            @if ($errors->has('email'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                    </div>
                </div>
                <div class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                        <input placeholder="Phone" type="phone" class="form-control" name="phone" value="{{ old('phone') }}" required>

                        @if ($errors->has('phone'))
                            <span class="help-block">
                                <strong>{{ $errors->first('phone') }}</strong>
                            </span>
                        @endif
                </div>
                <?php 
            } ?>
            <div class="form-actions">
                <button type="submit" id="register-submit-btn" class="btn red uppercase pull-right">Submit</button>
            </div>
        </form>
    </div>
	  
</div>



@endsection
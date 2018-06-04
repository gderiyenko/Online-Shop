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
  <a href="/add-image?product_id={{$product->id}}"><div class="button">Change image</div></a>
  <a href="/admin/products">Back to Products</a>
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
    <form role="form" method="POST" action="{{ url('/admin/submit-edit-product') }}">
        {{ csrf_field() }}
        <input type="hidden" class="form-control" name="product_id" value="{{$product->id}}">
        <input type="hidden" class="form-control" name="product_name" value="{{$product->name}}">

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" name="name" value="{{$product->name}}">
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="integer" class="form-control" name="price" value="{{$product->price}}">
        </div>

        <div class="form-group">
            <label for="weight">Weight:</label>
            <input type="integer" class="form-control" name="weight" value="{{$product->weight}}">
        </div>      

        <div class="form-group">
                <label for="weight_type">Weight type:</label>
                @php
                foreach($types as $key => $weight) 
                if ($weight->id != $product->weight_type){
                @endphp
                <span>{{$weight->name}}</span>
                <input type="radio" name="weight_type" value="{{$weight->id}}">
                <br>
                @php
            } else {
            @endphp
            <span>{{$weight->name}}</span>
            <input type="radio" name="weight_type" value="{{$weight->id}}" checked>
            <br>
            @php }
            @endphp
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <input type="textarea" class="form-control" name="description" value="{{$product->description}}">
        </div>
        <input type="submit" value="Send Request">
    </form>
</div>


{{Form::close()}}
<script type="text/javascript">
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#blah')
        .attr('src', e.target.result)
        .width(150)
        .height(200);
    };
    reader.readAsDataURL(input.files[0]);
}
}
</script>
@endsection

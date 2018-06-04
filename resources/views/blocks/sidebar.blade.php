<!-- left panel -->
<div class="page-sidebar-wrapper" style="position : fixed;">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu">

            <li class="nav-item"><a href=" {{ url('/list') }} ">All</a></li>

            <li class="nav-item"><a href="{{url('/list/sale')}}">Sale</a></li>
            <li class="heading">
                <h3 class="uppercase">Types</h3>
            </li>
            @php 
                foreach($allProductTypes as $type)
                if ($type->name == $thisType){
            @endphp
                <li class="nav-item"><a href="\list\{{$type->name}}"> {{$type->name}} </a></li>
            @php
                }else{
            @endphp
                <li class="nav-item"><a href="\list\{{$type->name}}"> {{$type->name}} </a></li>
            @php
                }
            @endphp
        </ul>
    </div>
</div>
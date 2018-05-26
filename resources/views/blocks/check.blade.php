<tr>
    <td class="highlight">
        <div class="success"></div>
        <a href="javascript:;"> {{ $product->name }} </a>
    </td>
    <td class="hidden-xs"> 
        @php
            echo number_format($product->weight * $product->count, 2, '.', '');
            if ($product->weight_type == 1)
                echo " liter";
            else
            if ($product->weight_type == 2)
                echo " kg.";
            else
                echo " gr.";
        @endphp </td>
    <td> 
        @php
        if (!is_null($product->sale_price)){
            echo number_format($product->sale_price * $product->count, 2, '.', '');
        }
        else{
            echo number_format($product->price * $product->count, 2, '.', '');
        }  
        @endphp </td>
    <td>
        <a href="/basket-delete-one?data={{$product->id}}" class="btn btn-outline btn-circle btn-sm purple">
            <i class="fa fa-edit"></i> Delete </a>
        <a href="javascript:;" class="btn btn-circle btn-default btn-sm" onclick ="AddOne({{$product->id}})">
            <i class="fa fa-plus"></i> Add </a>
    </td>
</tr>

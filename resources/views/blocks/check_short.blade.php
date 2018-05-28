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
</tr>

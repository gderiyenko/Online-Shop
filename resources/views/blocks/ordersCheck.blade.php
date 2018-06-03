<tr>
    <td class="highlight">
        <div class="success"></div>
        <a href="/product?id={{$product->product_id}}"> {{ $product->name }} </a>
    </td>
    <td class="hidden-xs"> 
        @php
            echo number_format($product->weight * $product->count, 2, '.', '') . " " . $product->weight_type;
        @endphp </td>
    <td> 
        @php
            echo number_format($product->cost * $product->count, 2, '.', '');
        @endphp </td>
</tr>

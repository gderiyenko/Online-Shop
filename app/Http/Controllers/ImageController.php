<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Product;

class ImageController extends Controller
{
    /**
    * Create view file
    *
    * @return void
    */
    public function getImage()
    {
        $product_id = $_GET['product_id'];
        return view('upload-image', ['produxt_id' => $product_id]);
    }
    /**
    * Manage Post Request
    *
    * @return void
    */
    public function postImage(Request $request)
    {
        $this->validate($request, [
            'image_file' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
        ]);
        $imageName = time().'.'.$request->image_file->getClientOriginalExtension();
        $request->image_file->move(public_path('assets/pages/img/page_general_search/'), $imageName);

        Product::updateImage($_POST['product_id'], $imageName);
        return redirect('/admin/edit-product?id='.$_POST['product_id']);
    }
}
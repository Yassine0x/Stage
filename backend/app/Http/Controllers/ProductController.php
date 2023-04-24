<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $products = Product::all();
        foreach ($products as $product) {
            $path = storage_path($product->image);
            if (Storage::exists($path)) {
                $product->image = url($product->image);
            }
        }
        return response()->json($products);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreProductRequest $request)
    {

        $data = $request->validated();
        //try {

        $product = new Product();
        $product->title = $data['title'];
        $product->slug = Str::of(fake()->sentence())->slug();
        $product->decription = $data['decription'];
        $product->price = $data['price'];
        $product->quantity = $data['quantity'];

        // $category_id = Category::join('products', 'products.id', '=', 'categories.id')
        //    ->select('categories.id')
        //    ->where('categories.title',$request->input('category'))
        //    ->get();
        // $product->category_id = $category_id;
        $category = Category::where('title', $request->input('category'))->first();
        $product->category_id = $category->id;
        $image = $request->file('image');

        if ($image) {
            $imagePath = $image->store('public/images');

            if ($imagePath) {
                $product->image = str_replace('public/', 'storage/', $imagePath);
            }
        } else {
            return response()->json(['error' => 'No image provided'], 400);
        }

        $product->save();

        return response()->json(['message' => 'Product created successfully']);
        // } catch (\Exception $e) {
        //     // handle exception here
        //     return response()->json(['message' => 'error pas cree'], 500);
        // }


        //
        // $product = new Product();
        // $product->title = $request->input('title');
        // $product->slug = Str::of(fake()->sentence())->slug();
        // $product->description = $request->input('description');
        // $product->price = $request->input('price');
        // $product->price = $request->input('old_price');
        // $product->quantity = $request->input('quantity');
        // $imagePath = $request->file('image')->store('public/images');
        // $product->image = str_replace('public/', 'storage/', $imagePath);
        // $product->save();

        // return response()->json(['message' => 'User created successfully']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        //
        $product = Product::find($product);
        return response()->json(['data' => $product]);
    }


    public function update(UpdateProductRequest $request, $productId)
{
    $data = $request->validated();
    $product = Product::findOrFail($productId);
    return response()->json([
        'data' => $data
    ]);
    $product->title = $request->title ?? $product->getOriginal('title');
    
    $product->slug = Str::slug($product->title) ?? $product->slug;
    $product->decription = $data['description'] ?? $product->getOriginal('decription');
    $product->price = $data['price'] ?? $product->getOriginal('price');
    $product->quantity = $data['quantity'] ?? $product->getOriginal('quantity');

    $category = Category::where('title', $request->input('category'))->first();
    $product->category_id = $category ? $category->id : $product->getOriginal('category_id');

    if ($request->hasFile('image')) {
        // Delete the old image file
        Storage::delete($product->getOriginal('image'));

        // Save the new image file
        $image = $request->file('image');
        $path = $image->store('public/images');
        $product->image = str_replace('public/', 'storage/', $path);
    }

    $product->save();
    return response()->json([
        'message' => 'Product updated successfully'
    ]);
}



    /**
     * Update the specified resource in storage.
     */
    // public function update(UpdateProductRequest $request, $id)
    // {
    //     //
    //     $data = $request->validated();
    //     $product = Product::where('id', $id)->first();
    //     if ($product){
    //     $product->title = $data['title'] ?? $product->getOriginal('title');
    //     //$product->slug = Str::slug($product->title) ?? $product->slug;
    //     $product->slug = Str::of(fake()->sentence())->slug();
    //     $product->description = $data['decription'] ?? $product->getOriginal('description');
    //     $product->price = $data['price'] ?? $product->getOriginal('price');
    //     $product->quantity = $data['quantity'] ?? $product->getOriginal('quantity');
    //     //$category = Category::where('title', $request->input('category') ?? '')->first();
    //     //$product->category_id = $category->id ?? $product->category_id;
    //     // $image = $request->file('image') ?? $product->image;
    //     // if ($image) {
    //     //     $imagePath = $image->store('public/images');

    //     //     if ($imagePath) {
    //     //         $product->image = str_replace('public/', 'storage/', $imagePath);
    //     //     }
    //     // } else {
    //     //     return response()->json(['error' => 'No image provided'], 400);
    //     // }

    //     $product->save();
    //     return response()->json([
    //         'message' => 'Product updated successfully'
    //       ]);
    //     }else{
    //         return response()->json([
    //             'message' => 'Product not found'
    //           ]);
    //     }

    // }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($productId)
    {
        //
        $product = Product::where('id', $productId)->first();
        if ($product) {
            $product->delete();
            Storage::delete($product->image);
            return response()->json(['message' => 'Product deleted successfully']);
        } else {
            return response()->json(['message' => 'Product not found']);
        }
    }
}

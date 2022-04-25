<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\Image;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\PostComment;
use App\Models\Product;
use App\Models\Utils;
use Illuminate\Http\Request;

class ApiProductsController
{
    public function upload_temp_file(Request $request)
    {

        

        if (
            isset($_FILES['file']) &&
            isset($_GET['user_id']) &&
            isset($_FILES['file']['error']) &&
            ($_FILES['file']['error'] == 0)
        ) {


            $img = $_FILES['file'];
            $raw_images = [];
            $raw_images['name'][] = $img['name'];
            $raw_images['type'][] = 'image/png';
            $raw_images['tmp_name'][] = $img['tmp_name'];
            $raw_images['error'][] = $img['error'];
            $raw_images['size'][] = $img['size'];

            $data = Utils::upload_images($raw_images);
            $user_id = $_GET['user_id'];
            if(
                isset($data[0]) &&
                isset($data[0]['src']) &&
                isset($data[0]['thumbnail']) &&
                isset($data[0]['user_id']) 
            ){
                $img = $data[0];
                $new_img = new Image();
                $new_img->src = $img['src'];
                $new_img->user_id = $user_id;
                $new_img->thumbnail = $img['thumbnail']; 
                $new_img->name = 'temp';
                $new_img->save(); 
            }
            die("1");
        }
        die("0");
    }
    public function delete(Request $request)
    {
        $id = (int) ($request->id ? $request->id : 0);
        if ($id < 1) {
            return Utils::response(['message' => 'Poduct ID is required.', 'status' => 0]);
        }

        $pro = Product::find($id);

        if ($pro == null) {
            return Utils::response(['message' => "Poduct with ID  {$id} no found.", 'status' => 0]);
        }
        $pro->delete();

        return Utils::response(['message' => "Poduct  #{$id} deleted successfully.", 'status' => 1]);
    }
    public function upload(Request $request)
    {
        return view('dashboard.upload');
    }

    public function delete_post(Request $request)
    {
        return "delete_post";
    }

    public function create_post(Request $request)
    {
        if (!isset($_POST['user_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }
        $p = new Post();
        $p->administrator_id = ((int)($_POST['user_id']));
        $p->posted_by = ((int)($_POST['user_id']));
        $p->post_category_id = ((int)($_POST['post_category_id']));
        if ($p->post_category_id < 1) {
            $p->post_category_id = 1;
        }
        $p->views = 0;
        $p->images = "";
        $p->audio = "";
        $p->comments = 0;
        $p->text = $_POST['text'];

        $images = [];
        $uploaded_images = [];
        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {

                    if (isset($_FILES['audio'])) {
                        if ($_FILES['audio'] != null) {
                            if (isset($_FILES['audio']['tmp_name'])) {
                                $p->audio = Utils::upload_file($_FILES['audio']);
                            };
                        }
                        unset($_FILES['audio']);
                    }

                    foreach ($_FILES as $img) {

                        if (
                            (isset($img['name'])) &&
                            (isset($img['type'])) &&
                            (isset($img['tmp_name'])) &&
                            (isset($img['error'])) &&
                            (isset($img['size']))
                        ) {
                            if (
                                (strlen($img['name']) > 2) &&
                                (strlen($img['type']) > 2) &&
                                (strlen($img['tmp_name']) > 2) &&
                                (strlen($img['size']) > 0) &&
                                ($img['error'] == 0)
                            ) {

                                $name = trim($img['name']);
                                if (str_contains($name, 'image_')) {
                                    $raw_images['name'][] = $img['name'];
                                    $raw_images['type'][] = 'image/png';
                                    $raw_images['tmp_name'][] = $img['tmp_name'];
                                    $raw_images['error'][] = $img['error'];
                                    $raw_images['size'][] = $img['size'];
                                }
                            }
                        }
                    }

                    if (isset($raw_images)) {
                        $images['images'] = $raw_images;
                        $uploaded_images = Utils::upload_images($images['images']);
                    }
                }
            }
        }



        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $p->thumnnail = json_encode($uploaded_images[0]);
            $p->images = json_encode($uploaded_images);
        }



        if ($p->save()) {
            return Utils::response(['message' => 'Post create successfully.', 'status' => 1, 'data' => $p]);
        } else {
            return Utils::response(['message' => 'Failed to create post. Please try again.', 'status' => 0, 'data' => $p]);
        }
        return 'create_post';
    }

    public function create(Request $request)
    {


        if (!isset($_POST['user_id'])) {
            return Utils::response(['message' => 'User ID is required.', 'status' => 0]);
        }

        $p['sub_category_id'] = 1;
        $p['user_id'] = trim($_POST['user_id']);
        $p['category_id'] = 1;
        $p['price'] = 1;
        $p['country_id'] = 1;
        $p['quantity'] = 1;
        $p['status'] = 1;
        $p['fixed_price'] = true;
        $p['city_id'] = 1;
        $p['name'] = trim($_POST["Advert's_title"]);
        $p['slug'] = trim($_POST["Advert's_title"]);
        $p['price'] = trim($_POST["Product_price"]);
        $p['description'] = trim($_POST["Product_description"]);
        $p['attributes'] = "[]";




        if (isset($_POST["Category"])) {
            if (strlen($_POST["Category"]) > 2) {
                $cat = Category::where('name', trim($_POST["Category"]))->first();
                if ($cat != null) {
                    $p['category_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["Sub_Category"])) {
            if (strlen($_POST["Sub_Category"]) > 2) {
                $cat = Category::where('name', trim($_POST["Sub_Category"]))->first();
                if ($cat != null) {
                    $p['sub_category_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["District"])) {
            if (strlen($_POST["District"]) > 2) {
                $cat = Country::where('name', trim($_POST["District"]))->first();
                if ($cat != null) {
                    $p['country_id'] = $cat->id;
                }
            }
        }

        if (isset($_POST["Sub_county"])) {
            if (strlen($_POST["Sub_county"]) > 2) {
                $cat = City::where('name', trim($_POST["Sub_county"]))->first();
                if ($cat != null) {
                    $p['city_id'] = $cat->id;
                }
            }
        }


        $images = [];
        $uploaded_images = [];
        if (isset($_FILES)) {
            if ($_FILES != null) {
                if (count($_FILES) > 0) {

                    foreach ($_FILES as $img) {
                        if (
                            (isset($img['name'])) &&
                            (isset($img['type'])) &&
                            (isset($img['tmp_name'])) &&
                            (isset($img['error'])) &&
                            (isset($img['size']))
                        ) {
                            if (
                                (strlen($img['name']) > 2) &&
                                (strlen($img['type']) > 2) &&
                                (strlen($img['tmp_name']) > 2) &&
                                (strlen($img['size']) > 0) &&
                                ($img['error'] == 0)
                            ) {
                                $raw_images['name'][] = $img['name'];
                                $raw_images['type'][] = 'image/png';
                                $raw_images['tmp_name'][] = $img['tmp_name'];
                                $raw_images['error'][] = $img['error'];
                                $raw_images['size'][] = $img['size'];
                            }
                        }
                    }

                    $images['images'] = $raw_images;

                    $uploaded_images = Utils::upload_images($images['images']);
                }
            }
        }




        if ($uploaded_images != null && count($uploaded_images) > 0) {
            $p['thumbnail'] = json_encode($uploaded_images[0]);
            $p['images'] = json_encode($uploaded_images);
        }


        $pro = Product::create($p);
        return Utils::response(['message' => 'Product uploaded successfully.', 'status' => 1, 'data' => $pro]);
    }


    public function post_categories(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 15);
        $items = PostCategory::paginate($per_page)->withQueryString()->items();

        return $items;
    }


    public function post_comments(Request $request)
    {
        $per_page = 1000;
        $post_id = (int) ($request->per_page ? $request->post_id : 0);
        $items = PostComment::paginate($per_page)->withQueryString()->items();

        return $items;
    }


    public function index(Request $request)
    {

        if(
            (!isset($request->lati)) &&
            (!isset($request->longi)) &&
            (!isset($request->cat_id)) 
        ){
            return [];
        }
        $loc['lati'] = $request->lati;
        $loc['long'] = $request->long;
        $loc['cat_id'] = $request->cat_id;

        $pros = Product::get_nearest_products($loc);

        return $pros;
        $per_page = (int) ($request->per_page ? $request->per_page : 200);
        $user_id = (int) ($request->user_id ? $request->user_id : 0);

        if ($user_id > 0) {
            $items = Product::where('user_id', $user_id)->orderBy('id', 'DESC')->paginate($per_page)->withQueryString()->items();
        } else {
            $items = Product::where([])->orderBy('id', 'DESC')->paginate($per_page)->withQueryString()->items();
            //$items = Product::paginate($per_page)->orderBy('id', 'DESC')->withQueryString()->items();
        }

        return $items;
    }


    public function posts(Request $request)
    {
        // $p = new Post();
        // $p->administrator_id = 1;
        // $p->post_category_id = 1;
        // $p->posted_by = 1;
        // $p->views = 5;
        // $p->comments = 2;
        // $p->text = "Another Simple post title";
        // $p->thumnnail = "";
        // $p->images = "";
        // $p->audio = "";
        // $p->save();

        // die();


        $per_page = (int) ($request->per_page ? $request->per_page : 15);
        $user_id = (int) ($request->user_id ? $request->user_id : 0);
        if ($user_id > 0) {
            $items = Post::where('administrator_id', $user_id)->paginate($per_page)->withQueryString()->items();
        } else {
            $items = Post::paginate($per_page)->withQueryString()->items();
        }
        return $items;
    }

    public function banners(Request $request)
    {
        $items = Banner::paginate(100)->withQueryString()->items();
        return $items;
    }

    public function locations(Request $request)
    {
        return Utils::get_locations();
    }

    public function categories(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page : 1000);
        $items = Category::paginate($per_page)->withQueryString()->items();

        $_items = [];
        foreach ($items as $key => $value) {
            $_attributes = $value->attributes;
            $attributes = [];
            foreach ($_attributes as $_key => $_value) {
                $attributes[] = json_encode($_value);
            }
            $value->attributes = null;
            unset($value->attributes);
            $value->attributes =  $attributes;
            $_items[] = $value;
        }


        return $items;
    }
}

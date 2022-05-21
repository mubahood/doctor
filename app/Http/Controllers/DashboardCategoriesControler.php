<?php
//most latest change
namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Profile;
use App\Models\Utils;
use App\Models\Attribute;
use App\Models\Category;
use App\Models\Chat; 
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class DashboardCategoriesControler extends Controller
{
    public function index()
    {
        return view('metro.dashboard.categories');
    }

    public function show()
    {
        return view('metro.dashboard.categories');
    }
    public function edit()
    {
        return view('metro.dashboard.categories');
    }

    public function store(Request $r)
    { 
        if (isset($_POST['delete'])) {
            $id = (int)($r->delete);
            $item = Category::find($id);
            if ($item != null) {
                $item->delete();
                return true;
            }
            return 0;
        }

        if (isset($_POST['edit'])) {
 
            $id = (int)($r->edit);
            if ($id == 0) {
                die("new");
            } else {
                $item = Category::find($id);
                if ($item == null) {
                    dd("Item not found.");
                }
                $item->parent = $r->parent; 
                $item->name = $r->name;
                $item->description = $r->description;
    
                if (isset($_FILES['avatar'])) {
                    
                    $img = $_FILES['avatar'];
                    $raw_images = [];
                    $item->image = 'no_image.png';
                    $raw_images['name'][] = $img['name'];
                    $raw_images['type'][] = 'image/png';
                    $raw_images['tmp_name'][] = $img['tmp_name'];
                    $raw_images['error'][] = $img['error'];
                    $raw_images['size'][] = $img['size'];
    
                    $temp_img = Utils::upload_images($raw_images);
                    if ($temp_img != null) {
                        if (isset($temp_img[0])) {
                            $item->image = $temp_img[0]['src'];
                        }
                    }
                }

                $item->save();
            }

            return redirect('dashboard/categories');
        } else if (isset($_POST['create'])) {

            $item = new Category(); 
            $item->parent = $r->parent;
            $item->name = $r->name;
            $item->description = $r->description;

            if (isset($_FILES['avatar'])) {
                
                $img = $_FILES['avatar'];
                $raw_images = [];
                $item->image = 'no_image.png';
                $raw_images['name'][] = $img['name'];
                $raw_images['type'][] = 'image/png';
                $raw_images['tmp_name'][] = $img['tmp_name'];
                $raw_images['error'][] = $img['error'];
                $raw_images['size'][] = $img['size'];

                $temp_img = Utils::upload_images($raw_images);
                if ($temp_img != null) {
                    if (isset($temp_img[0])) {
                        $item->image = $temp_img[0]['src'];
                    }
                }
            }

            $item->save();
            return redirect('dashboard/categories');
        }


        if (isset($_POST['_order'])) {
            $items = json_decode($r->_order);
            foreach ($items as $parent_key => $parent) {
                $p = Category::find($parent->id);
                $order = 0;

                if ($p != null) {
                    $p->order = $order;
                    $p->parent = 0;
                    $p->save();
                    $order++;

                    if (isset($parent->children) && ($parent->children != null)  && (!empty($parent->children))) {
                        foreach ($parent->children as $kid_key => $kid) {
                            $k = Category::find($kid->id);
                            if ($k != null) {
                                $order++;
                                $k->order = $order;
                                $k->parent = $p->id;
                                $k->save();
                            }
                        }
                    }
                }
            }
        }
        return true;
    }
}

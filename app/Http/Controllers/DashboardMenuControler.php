<?php
//most latest change
namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Profile;
use App\Models\Utils;
use App\Models\Attribute;
use App\Models\Chat;
use App\Models\MenuItem;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class DashboardMenuControler extends Controller
{
    public function index()
    {
        return view('metro.dashboard.menu');
    }

    public function show()
    {
        return view('metro.dashboard.menu');
    }

    public function store(Request $r)
    {



        if (isset($_POST['delete'])) {
            $id = (int)($r->delete);
            $item = MenuItem::find($id);
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
                $item = MenuItem::find($id);
                if ($item == null) {
                    dd("Item not found.");
                }
                $item->parent_id = $r->parent_id;
                $item->title = $r->title;
                $item->uri = $r->uri;
                $item->icon = $r->icon;
                $item->role = $r->role;
                $item->save();
            }

            return redirect('dashboard/menu');
        } else if (isset($_POST['create'])) {

            $item = new MenuItem();
            $item->parent_id = $r->parent_id;
            $item->title = $r->title;
            $item->uri = $r->uri;
            $item->icon = $r->icon;
            $item->role = $r->role;
            $item->save();
            return redirect('dashboard/menu');
        }


        if (isset($_POST['_order'])) {
            $items = json_decode($r->_order);
            foreach ($items as $parent_key => $parent) {
                $p = MenuItem::find($parent->id);
                $order = 0;

                if ($p != null) {
                    $p->order = $order;
                    $p->parent_id = 0;
                    $p->save();
                    $order++;

                    if (isset($parent->children) && ($parent->children != null)  && (!empty($parent->children))) {
                        foreach ($parent->children as $kid_key => $kid) {
                            $k = MenuItem::find($kid->id);
                            if ($k != null) {
                                $order++;
                                $k->order = $order;
                                $k->parent_id = $p->id;
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

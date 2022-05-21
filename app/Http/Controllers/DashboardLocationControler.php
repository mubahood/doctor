<?php
//most latest change
namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Profile;
use App\Models\Utils;
use App\Models\Attribute;
use App\Models\Chat;
use App\Models\Location;
use Hamcrest\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class DashboardLocationControler extends Controller
{
    public function index()
    {
        return view('metro.dashboard.location');
    }

    public function show()
    {
        return view('metro.dashboard.location');
    }
    public function edit()
    {
        return view('metro.dashboard.location');
    }

    public function store(Request $r)
    { 
        if (isset($_POST['delete'])) {
            $id = (int)($r->delete);
            $item = Location::find($id);
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
                $item = Location::find($id);
                if ($item == null) {
                    dd("Item not found.");
                }
                $item->parent = $r->parent;
                $item->name = $r->name;
                $item->save();
            }

            return redirect('dashboard/locations');
        } else if (isset($_POST['create'])) {



            $item = new Location();
            $item->parent = $r->parent;
            $item->name = $r->name;
            $item->save();
            return redirect('dashboard/locations');
        }


        if (isset($_POST['_order'])) {
            $items = json_decode($r->_order);
            foreach ($items as $parent_key => $parent) {
                $p = Location::find($parent->id);
                $order = 0;

                if ($p != null) {
                    $p->order = $order;
                    $p->parent = 0;
                    $p->save();
                    $order++;

                    if (isset($parent->children) && ($parent->children != null)  && (!empty($parent->children))) {
                        foreach ($parent->children as $kid_key => $kid) {
                            $k = Location::find($kid->id);
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

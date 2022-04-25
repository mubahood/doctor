<?php
//most latest change
namespace App\Http\Controllers;
 
use App\Models\Utils; 
use App\Models\Hospital; 
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class DashboardHospitalsControler extends Controller
{
    public function index()
    {
        return view('metro.dashboard.hospitals');
    }

    public function show()
    {
        return view('metro.dashboard.hospitals');
    }
    public function edit()
    {
        return view('metro.dashboard.hospitals');
    }

    public function store(Request $r)
    { 
        if (isset($_POST['delete'])) {
            $id = (int)($r->delete);
            $item = Hospital::find($id);
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
                $item = Hospital::find($id);
                if ($item == null) {
                    dd("Item not found.");
                }
                 $item->name = $r->name;
                $item->details = $r->details;

    
                if (isset($_FILES['avatar'])) {
                    
                    $img = $_FILES['avatar'];
                    $raw_images = [];
                    $item->photo = 'no_image.png';
                    $raw_images['name'][] = $img['name'];
                    $raw_images['type'][] = 'image/png';
                    $raw_images['tmp_name'][] = $img['tmp_name'];
                    $raw_images['error'][] = $img['error'];
                    $raw_images['size'][] = $img['size'];
    
                    $temp_img = Utils::upload_images($raw_images);
                    if ($temp_img != null) {
                        if (isset($temp_img[0])) {
                            $item->photo = $temp_img[0]['src'];
                        }
                    }
                }

                $item->save();
            }

            return redirect('dashboard/hospitals');
        } else if (isset($_POST['create'])) {


            $item = new Hospital();  
            $item->name = $r->name;
            $item->details = $r->details;
            $item->location_id = $r->location_id;
            $item->latitude = $r->latitude;
            $item->longitude = $r->longitude;
            $item->photo = 'no_image.png';
                
            if (isset($_FILES['avatar'])) {
                
                $img = $_FILES['avatar'];
                $raw_images = [];
                $item->photo = 'no_image.png';
                $raw_images['name'][] = $img['name'];
                $raw_images['type'][] = 'image/png';
                $raw_images['tmp_name'][] = $img['tmp_name'];
                $raw_images['error'][] = $img['error'];
                $raw_images['size'][] = $img['size'];

                $temp_img = Utils::upload_images($raw_images);
                if ($temp_img != null) {
                    if (isset($temp_img[0])) {
                        $item->photo = $temp_img[0]['src'];
                    }
                }
            }
            
            $item->save();
            return redirect('dashboard/hospitals');
        }

 
    }
}

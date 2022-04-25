<?php
use App\Models\Product;
use App\Models\User;

// $imgs = [];
// for ($i = 1; $i < 16; $i++) {
//     $img['src'] = $i . '.png';
//     $img['thumbnail'] = $i . '.png';
//     $img['user_id'] = 1;
//     $imgs[] = $img;
// }

// $pros = Product::all();
// foreach ($pros as $key => $p) {
//     shuffle($imgs);
//     $p->thumbnail = json_encode($imgs[2]);
//     $p->save();
// }


$users = [];
$u = Auth::user();
if ($u->user_type != 'admin') {
    $users = Product::where('user_id', $u->id);
} else {
    $users = Product::all();
}

$head = ['ID', 'Thumnail', 'Name', 'Price', 'Category', 'Hospital', 'Doctor', 'Contact', 'Created'];
$rows = [];
$create_link = url('dashboard/products/create');
$delete_link = url('dashboard/products');
$edit_link = url('dashboard/products/edit');
$view_link = url('dashboard/products');
$has_actions = true;
foreach ($users as $key => $v) {
    $row = [];
    $row[] = $v->id;
    $row[] = $v->id;
    $row[] =
        '<span href="{{ $_link }}" class="symbol symbol-50px">
                <span class="symbol-label" style="background-image:url(' .
        $v->get_thumbnail() .
        ');"></span>
             </span>';
    $row[] = '<b class="text-dark">' . $v->name . '</b>';
    $row[] = $v->price;
    $row[] = $v->category_name;
    $row[] = $v->hospital_id;
    $row[] = $v->seller_name;
    $row[] = $v->seller_phone;
    $row[] = $v->created_at;
    $row['edit_link'] = url('dashboard/products/' . $v->id . '/edit');
    $row['view_link'] = url($v->slug);
    $rows[] = $row;
}

?>
@extends('metro.layout.layout-dashboard')




@section('dashboard-content')
    @include('metro.components.table')
@endsection

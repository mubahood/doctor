<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DataTables\AppointmentsDataTable;

class AppointmentsController extends Controller
{
    public function index(AppointmentsDataTable $dataTable)
    {
        return $dataTable->render('appointments');
    }

    public function edit()
    {
        return  view('metro.dashboard.users-create');
    }
}

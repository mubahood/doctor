<?php

namespace App\DataTables;

use App\Models\User;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class UsersDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * 
     * 
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query)
            ->editColumn('id', function (User $model) {
                return view('metro.components.table-item-1', [
                    'title' => $model->name." ".$model->last_name,
                    'img' => $model->photo,
                    'sub_title' => $model->username,
                    'link' => url('/' . $model->phone_number),
                ]);
            });
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(User $model)
    {
        return $model->newQuery();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->setTableId('users-table')
            ->columns([
                'id',
                'name',
                'phone_number',
                'user_type',
                'address',
                'created_at', 
            ])
            ->minifiedAjax()
            ->dom('rftlpi') 
            ->orderBy(1)
            ->addTableClass(' align-middle table-row-dashed fs-6 gy-5');
    }
    /*
	
	
division


region	
facebook	
twitter	
whatsapp	
youtube	
instagram	
last_seen	
status	
linkedin	
category_id	
status_comment	
country_id	
district	
sub_county	
	
*/

    /**
     * Get columns.
     * 
     * @return array
     */
    protected function getColumns()
    {
        return [
            Column::make('id')->title('User'),
            Column::make('created_at'),
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Users_' . date('YmdHis');
    }
}

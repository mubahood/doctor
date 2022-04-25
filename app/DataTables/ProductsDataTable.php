<?php

namespace App\DataTables;

use App\Models\Product;
use Illuminate\Database\Eloquent\Collection;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class ProductsDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
        ->eloquent($query)
        ->rawColumns(['nature_of_offer', 'price','quantity',
            'city_id',
            'user_id',
            'created_at',
        ])
        ->editColumn('id', function (Product $model) {
            return view('metro.components.table-item',[
                'title'=>$model->name,
                'img'=>$model->get_thumbnail(),
                'link'=> url($model->slug),
            ]);
        }) 
       
        ->editColumn('price', function (Product $model) {
            return '<span class="text-gray-900"> UGX '.$model->price.'</span>';
        })
        ->editColumn('quantity', function (Product $model) {
            return '<span class="text-gray-500 text-center">'.$model->quantity.'</span>';
        }) 
        ->editColumn('city_id', function (Product $model) {
            return '<span class="text-gray-500">'.$model->city_name.'</span>';
        })
        
        ->editColumn('user_id', function (Product $model) {
            return '<span class="text-gray-500">'.$model->seller_name.'</span>';
        })
        
        ->editColumn('created_at', function (Product $model) {
            return '<span class="text-gray-500">'.$model->created_at.'</span>';
        })
        ->editColumn('nature_of_offer', function (Product $model) {
            if($model->nature_of_offer != 'For sale'){
                return '<span class="badge badge-light-success">'.$model->nature_of_offer.'</span>';
            }else{
                return '<span class="badge badge-light-primary">'.$model->nature_of_offer.'</span>';
            }
        })
        ->addColumn('actions', function (Product $model) {
            return view('metro.components.table-actions', compact('model'));
        });
        ;

        //->addColumn('action', 'products.action');
    }



    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            Column::make('id')->title('Product')->addClass('fw-bolder'), 
            Column::make('price')->title('Price')->addClass('fw-bolder'), 
            Column::make('quantity')->title('QTY')->addClass('fw-bolder text-center'),  
            Column::make('city_id')->title('Location')->addClass('fw-bolder'), 
            Column::make('user_id')->title('Owner')->addClass('fw-bolder'), 
            Column::make('nature_of_offer')->title('Offer')->addClass('fw-bolder'), 
            Column::make('created_at')->title('Created')->addClass('fw-bolder'), 
            Column::computed('actions')
            ->exportable(false)
            ->printable(false)
            ->addClass('text-center')
            ->responsivePriority(-1)
        ];
    }


    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Product $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Product $model)
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
            ->setTableId('products-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom('Bfrtip')
            ->orderBy(0)
            ->buttons(
                Button::make('create'),
                Button::make('export'),
                Button::make('print'),
                Button::make('reset'),
            )->addTableClass(' table align-middle table-row-dashed fs-6 gy-5 dataTable no-footer');
    }

  

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Products_' . date('YmdHis');
    }
}

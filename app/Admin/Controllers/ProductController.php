<?php

namespace App\Admin\Controllers;

use App\Models\Hospital;
use App\Models\Product;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Product';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());


        $grid->filter(function ($filter) {

         
            $filter->equal('hospital_id', "Filter by Hospital")->select(Hospital::all()->pluck('name', 'id'));
            
        });




        $grid->column('id', __('Id'))->sortable();
        $grid->column('name', __('Name'));
        $grid->column('hospital_id', __('Hospital'))->display(function ($m){
            if($this->hospital == null){
                return '';
            }
            return $this->hospital->name;
        });
        $grid->column('doctor_id', __('Doctor'))->display(function ($m){
            return $this->doctor->name;
        });

        $grid->column('price', __('Price'));
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('category_id', __('Category id'));
        $show->field('user_id', __('User id'));
        $show->field('country_id', __('Country id'));
        $show->field('city_id', __('City id'));
        $show->field('price', __('Price'));
        $show->field('slug', __('Slug'));
        $show->field('status', __('Status'));
        $show->field('description', __('Description'));
        $show->field('quantity', __('Quantity'));
        $show->field('images', __('Images'));
        $show->field('thumbnail', __('Thumbnail'));
        $show->field('attributes', __('Attributes'));
        $show->field('sub_category_id', __('Sub category id'));
        $show->field('fixed_price', __('Fixed price'));
        $show->field('nature_of_offer', __('Nature of offer'));
        $show->field('hospital_id', __('Hospital id'));
        $show->field('doctor_id', __('Doctor id'));
        $show->field('location_id', __('Location id'));
        $show->field('latitude', __('Latitude'));
        $show->field('longitude', __('Longitude'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());

        $form->text('name', __('Service name'))->required();

        $hops = Hospital::get_items();
        $form->select('hospital_id', 'Hospital')->options($hops)->required();

        $admins = Administrator::get_items();
        $form->select('doctor_id', 'Doctor')->options($admins)->required();
  
        $form->text('price', __('Price'))->attribute(['type'=>'number'])->required();

        $form->hidden('category_id', __('Category id'))->default(1);
        $form->hidden('user_id', __('User id'))->default(1);
        $form->hidden('country_id', __('Country id'))->default(1)->default(1);
        $form->hidden('city_id', __('City id'))->default(1);
        $form->hidden('slug', __('Slug'));
        $form->hidden('status', __('Status'))->default(1);
        $form->textarea('description', __('Description'));
        $form->hidden('quantity', __('Quantity'))->default(1);
        $form->hidden('images', __('Images'))->default("[]");
        $form->image('thumbnail', __('Thumbnail'));
        $form->hidden('attributes', __('Attributes'))->default("[]");
        $form->hidden('sub_category_id', __('Sub category id'))->default("1");
        $form->hidden('fixed_price', __('Fixed price'))->default('Negotiable');
        $form->hidden('nature_of_offer', __('Nature of offer'))->default('For sale');

        $form->hidden('location_id', __('Location id'))->default("1");
        $form->hidden('latitude', __('Latitude'))->default("0.00");
        $form->hidden('longitude', __('Longitude'))->default("0.00");

        return $form;
    }
}

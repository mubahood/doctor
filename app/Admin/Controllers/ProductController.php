<?php

namespace App\Admin\Controllers;

use App\Models\Product;
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

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('name', __('Name'));
        $grid->column('category_id', __('Category id'));
        $grid->column('user_id', __('User id'));
        $grid->column('country_id', __('Country id'));
        $grid->column('city_id', __('City id'));
        $grid->column('price', __('Price'));
        $grid->column('slug', __('Slug'));
        $grid->column('status', __('Status'));
        $grid->column('description', __('Description'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('images', __('Images'));
        $grid->column('thumbnail', __('Thumbnail'));
        $grid->column('attributes', __('Attributes'));
        $grid->column('sub_category_id', __('Sub category id'));
        $grid->column('fixed_price', __('Fixed price'));
        $grid->column('nature_of_offer', __('Nature of offer'));
        $grid->column('hospital_id', __('Hospital id'));
        $grid->column('doctor_id', __('Doctor id'));
        $grid->column('location_id', __('Location id'));
        $grid->column('latitude', __('Latitude'));
        $grid->column('longitude', __('Longitude'));

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

        $form->text('name', __('Name'));
        $form->number('category_id', __('Category id'));
        $form->number('user_id', __('User id'));
        $form->number('country_id', __('Country id'))->default(1);
        $form->number('city_id', __('City id'));
        $form->text('price', __('Price'));
        $form->text('slug', __('Slug'));
        $form->text('status', __('Status'));
        $form->textarea('description', __('Description'));
        $form->text('quantity', __('Quantity'));
        $form->textarea('images', __('Images'));
        $form->textarea('thumbnail', __('Thumbnail'));
        $form->textarea('attributes', __('Attributes'));
        $form->number('sub_category_id', __('Sub category id'));
        $form->text('fixed_price', __('Fixed price'))->default('Negotiable');
        $form->text('nature_of_offer', __('Nature of offer'))->default('For sale');
        $form->number('hospital_id', __('Hospital id'));
        $form->number('doctor_id', __('Doctor id'));
        $form->number('location_id', __('Location id'));
        $form->text('latitude', __('Latitude'));
        $form->text('longitude', __('Longitude'));

        return $form;
    }
}

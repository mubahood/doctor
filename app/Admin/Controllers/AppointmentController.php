<?php

namespace App\Admin\Controllers;

use App\Models\Appointment;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AppointmentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Appointment';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Appointment());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('hospital_id', __('Hospital id'));
        $grid->column('doctor_id', __('Doctor id'));
        $grid->column('client_id', __('Client id'));
        $grid->column('status', __('Status'));
        $grid->column('price', __('Price'));
        $grid->column('latitude', __('Latitude'));
        $grid->column('longitude', __('Longitude'));
        $grid->column('order_location', __('Order location'));
        $grid->column('category_id', __('Category id'));
        $grid->column('appointment_time', __('Appointment time'));
        $grid->column('details', __('Details'));
        $grid->column('payment_status', __('Payment status'));
        $grid->column('payment_method', __('Payment method'));

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
        $show = new Show(Appointment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('hospital_id', __('Hospital id'));
        $show->field('doctor_id', __('Doctor id'));
        $show->field('client_id', __('Client id'));
        $show->field('status', __('Status'));
        $show->field('price', __('Price'));
        $show->field('latitude', __('Latitude'));
        $show->field('longitude', __('Longitude'));
        $show->field('order_location', __('Order location'));
        $show->field('category_id', __('Category id'));
        $show->field('appointment_time', __('Appointment time'));
        $show->field('details', __('Details'));
        $show->field('payment_status', __('Payment status'));
        $show->field('payment_method', __('Payment method'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Appointment());

        $form->number('hospital_id', __('Hospital id'))->default(1);
        $form->number('doctor_id', __('Doctor id'))->default(1);
        $form->number('client_id', __('Client id'))->default(1);
        $form->text('status', __('Status'));
        $form->text('price', __('Price'));
        $form->text('latitude', __('Latitude'));
        $form->text('longitude', __('Longitude'));
        $form->text('order_location', __('Order location'));
        $form->text('category_id', __('Category id'));
        $form->text('appointment_time', __('Appointment time'));
        $form->textarea('details', __('Details'));
        $form->text('payment_status', __('Payment status'))->default('not paid');
        $form->text('payment_method', __('Payment method'));

        return $form;
    }
}

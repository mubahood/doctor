<?php

namespace App\Admin\Controllers;

use App\Models\Appointment;
use Carbon\Carbon;
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
        $grid->disableCreateButton();


        $grid->column('id', __('Id'))->sortable();
        $grid->column('created_at', __('Created'))->display(function ($t) {
            return Carbon::parse($t)->diffForHumans();
        });
        $grid->column('hospital_id', __('Hospital'))->display(function ($t) {
            return $this->hospital->name;
        });
        $grid->column('doctor_id', __('Doctor'))->display(function ($t) {
            return $this->doctor->name;
        });
        $grid->column('client_name', __('Client Name'));
        $grid->column('client_phone', __('Client Phone'));
        $grid->column('client_address', __('Client Address'));
        $grid->column('price', __('Price'));
        $grid->column('status', __('Status'));
        $grid->column('appointment_time', __('Appointment time'));
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

        $form->text('client_name', __('Client name'))->readonly();
        $form->text('client_phone', __('Client phone'))->readonly();
        $form->text('client_address', __('Client address'))->readonly();
        $form->text('details', __('Service'));

        $form->select('status', 'Status')->options([
            'pending' => 'Pending',
            'accepted' => 'Accepted',
            'completed' => 'Completed',
        ])->required();  

        $form->select('payment_status', 'Payment status')->options([
            'paid' => 'Paid',
            'not paid' => 'Not paid',
        ])->required(); 
        $form->text('price', __('Price'))->attribute(['type'=>'number']);

        $form->select('payment_method', 'Payment method')->options([
            'Cash' => 'Cash',
            'Mobile money' => 'Mobile money',
            'Bank' => 'Bank',
        ])->required(); 

        $form->datetime('appointment_time', __('Appointment time'));
        return $form;
    }
}

class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
   @customer = Customer.page(params[:page])
   @customers = Customer.all
  end

  def show
   @customer = Customer.find(params[:id])
   @items = Item.where(customer_id: @customer.id).page(params[:page]).per(8)
  end

  def edit
   @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    redirect_to admin_customer_path
   else
    render 'admin/customers/edit'
   end
  end

  private

  def customer_params
   params.require(:customer).permit(:email, :name, :is_deleted)
  end
end

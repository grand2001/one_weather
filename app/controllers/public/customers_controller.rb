class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def index
   @customer = Customer.ture_customer.page(params[:page]).per(10)
   @customers = Customer.ture_customer
  end

  def show
   @customer = Customer.find(params[:id])
   @items = Item.where(customer_id: @customer.id).page(params[:page]).per(8)
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   if @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
   else
    render 'public/customers/edit'
   end
  end


private

  def customer_params
   params.require(:customer).permit(:email, :name, :is_deleted)
  end
end

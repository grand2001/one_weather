class Admin::SearchesController < ApplicationController
 before_action :authenticate_admin!

 def index
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
      @customer = Customer.looks(params[:search], params[:word])
    else
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
      @item = Item.looks(params[:search], params[:word])
    end
 end
end

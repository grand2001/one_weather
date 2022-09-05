class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word]).where(is_deleted: false).page(params[:page]).per(10)
      @customer = Customer.looks(params[:search], params[:word]).where(is_deleted: false)
    else
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
      @item = Item.looks(params[:search], params[:word])
    end
  end

  private

  def searche_params
   params.require(:searche).permit(:genre_id, :item_id, :customer_id)
  end
end

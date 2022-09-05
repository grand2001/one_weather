class Public::HomesController < ApplicationController
 before_action :authenticate_customer!, only: [:mypage]
  def top
   @item = Item.joins(:customer).merge(Customer.where(is_deleted: false)).order(created_at: :desc).limit(4)
   @items = Item.joins(:customer).merge(Customer.where(is_deleted: false))
  end

  def about
  end

  def mypage
   @genres = Genre.all
   @items = Item.joins(:customer).merge(Customer.where(is_deleted: false))
   @favorites = Favorite.where(customer_id: current_customer.id).page(params[:page]).per(8)
  end
end

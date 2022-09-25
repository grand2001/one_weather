class Public::HomesController < ApplicationController
 before_action :authenticate_customer!, only: [:mypage]
  def top
   @item = Item.ture_item
   @items = Item.ture_item.order(created_at: :desc).limit(4)
  end

  def about
  end

  def mypage
   @genres = Genre.all
   @items = Item.ture_item
   @favorites = Favorite.where(customer_id: current_customer.id).page(params[:page]).per(8)
  end
end

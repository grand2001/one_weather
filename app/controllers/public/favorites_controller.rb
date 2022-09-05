class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  def create
   @item = Item.find(params[:item_id])
    favorite = @item.favorites.new(customer_id: current_customer.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
   @item = Item.find(params[:item_id])
    favorite = @item.favorites.find_by(customer_id: current_customer.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end

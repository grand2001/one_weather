class Public::ItemGenresController < ApplicationController
 before_action :authenticate_customer!

  def index
   @genre = Genre.find(params[:genre])
   @genres = Genre.all
   @item = Item.where(genre_id: params[:genre]).ture_item
   @items = Item.where(genre_id: params[:genre]).ture_item.page(params[:page]).per(8)
  end

  private

  def item_genre_params
   params.require(:item).permit(:genre_id, :item_id)
  end
end

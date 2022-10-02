class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
   @item = Item.all
   @items = Item.all.order(created_at: :desc).page(params[:page]).per(8)
   @genres = Genre.all
  end

end

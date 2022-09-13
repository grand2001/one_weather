class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
   @item = Item.page(params[:page]).per(8)
   @items = Item.all
   @genres = Genre.all
  end
  
end

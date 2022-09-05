class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def show
   @item = Item.find(params[:id])
   @comments = Comment.where(item_id: @item.id).page(params[:page]).per(10)
  end

  def destroy
   @item = Item.find(params[:id])
   @item.destroy
   redirect_to admin_root_path
  end
end

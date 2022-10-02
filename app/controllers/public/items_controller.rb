class Public::ItemsController < ApplicationController
 before_action :authenticate_customer!, only: [:new, :edit]

  def index
   @item = Item.ture_item
   @items = Item.ture_item.order(created_at: :desc).page(params[:page]).per(8)
   @genre = Genre.all
  end

  def show
   @item = Item.find(params[:id])
   @comments = Comment.where(item_id: @item.id).page(params[:page]).per(10)
   @comment = Comment.new
  end

  def new
   @item = Item.new
   @genre = Genre.all
  end

  def edit
   @genres = Genre.all
   @item = Item.find(params[:id])
   if @item.customer != current_customer
    redirect_to item_path(@item.id)
   end
  end

  def create
   @item = current_customer.items.new(item_params)
   if @item.save
    redirect_to item_path(@item.id)
   else
    @genre = Genre.all
    render 'public/items/new'
   end
  end

  def destroy
   @item = Item.find(params[:id])
   @item.destroy
   redirect_to items_path
  end

  def update
   @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to item_path(@item.id)
   else
    @item = Item.find(params[:id])
    @comments = Comment.where(item_id: @item.id).page(params[:page]).per(10)
    @comment = Comment.new
    render 'public/items/show'
   end
  end

 private

  def item_params
   params.require(:item).permit(:name, :image, :introduction, :genre_id, :comment_id, :customer_id)
  end
end

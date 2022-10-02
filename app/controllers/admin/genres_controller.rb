class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
   @genre_new = Genre.new
   @genres = Genre.page(params[:page]).per(10)
   @genre = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
   @genre = Genre.new(genre_params)
   if @genre.save
    redirect_to admin_genres_path
   else
    @genre_new = Genre.new
    @genres = Genre.page(params[:page]).per(10)
    @genre = Genre.all
    render 'admin/genres/index'
   end
  end

  def update
   @genre = Genre.find(params[:id])
   if @genre.update(genre_params)
    redirect_to admin_genres_path
   else
    render 'admin/genres/edit'
   end
  end

  private

  def genre_params
   params.require(:genre).permit(:name)
  end
end

class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  def edit
    @genre = Genre.find(params[:id])
  end
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    if @genre.class_status == "無効"
      @genre.products.update_all(sales_status: 1)
    end
    redirect_to admin_genres_path
  end

  private
  def genre_params
      params.require(:genre).permit(:id, :class_status, :name)
  end
end

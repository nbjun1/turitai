class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルを追加しました"
    else
      render :index
    end
  end

  def edit

  end

  def update

  end

  private

  def genre_params
    params.require(:genre).permit(:method)
  end
end

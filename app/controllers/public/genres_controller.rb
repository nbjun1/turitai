class Public::GenresController < ApplicationController

  def index
    @member = current_member
    @genres = Genre.page(params[:page])
  end

  def show
    @member = current_member
    @genre = Genre.find(params[:id])
    @results = @genre.result.page(params[:page])
  end
end

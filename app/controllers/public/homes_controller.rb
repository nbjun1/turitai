class Public::HomesController < ApplicationController

  def top
    @results = Result.all.order(created_at: :desc).page(params[:page])
    @genre = Genre.all
    @member = current_member
  end

  def about
  end
end

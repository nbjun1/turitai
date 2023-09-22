class Member::FavoritesController < ApplicationController

  def create
    result = Result.find(params[:result_id])
    favorite = current_member.favorites.new(result_id: result.id)
    favorite.save
    redirect_to member_result_show_path(result)
  end

  def destroy
    result = Result.find(params[:result_id])
    favorite = current_member.favorites.find_by(result_id: result.id)
    favorite.destroy
    redirect_to member_result_show_path(result)
  end

end

class Member::ResultsController < ApplicationController
  def index
    @member = current_member
  end

  def show
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to member_result_show_path(@result), notice: "釣果を投稿しました"
    else
      flash[:result_created_error] = "釣果が正常に保存されませんでした。"
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:title, :body, :images, :name, :point, :genre_id, :time, :weather, :tide, :tide_updowa, :wave, :light, :area, :area_detail, :moon)
  end
end

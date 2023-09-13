class Member::ResultsController < ApplicationController
  def index
    @member = current_member
    @results = Result.where(member_id: current_member.id).includes(:member).order(created_at: :desc).page(params[:page])
  end

  def show
    @result = Result.find(params[:id])
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.member_id = current_member.id
    if @result.save
      redirect_to member_result_show_path(@result), notice: "釣果を投稿しました"
    else
      flash[:result_created_error] = "釣果が正常に投稿されませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def result_params
    params.require(:result).permit(:title, :body, :name, :point, :genre_id, :time, :weather, :tide, :tide_updown, :wave, :light, :area, :area_detail, :moon, result_images: [])
  end
end

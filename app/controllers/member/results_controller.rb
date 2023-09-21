class Member::ResultsController < ApplicationController

  def index
    @member = Member.find(params[:id])
    @results = Result.where(member_id: @member.id).includes(:member).order(created_at: :desc).page(params[:page])
  end

  def show
    @result = Result.find(params[:id])
    @comment = Comment.new
    @member = @result.member
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
      render :new, notice: "釣果が正常に投稿されませんでした。"
    end
  end

  def edit
    @result = Result.find(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    if @result.update(result_params)
      redirect_to member_result_show_path(@result.id), notice: "釣果を編集しました。"
    else
      render :edit, notice: "編集情報に誤りがあります"
    end
  end

  def destroy
    @result = Result.find(params[:id])
    @member = @result.member
    @result.destroy
    redirect_to member_mypage_path(@member.id), notice: "削除しました。"
  end

  private

  def result_params
    params.require(:result).permit(:title, :body, :name, :point, :genre_id, :time, :weather, :tide, :tide_updown, :wave, :light, :area, :area_detail, :moon, result_images: [])
  end
end

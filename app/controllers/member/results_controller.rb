class Member::ResultsController < ApplicationController

  before_action :authenticate_member!, only: [:new]

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
    @prefectures = Heartrails::GeoAPI.get_prefectures
  end

  def cities
    prefecture = params[:prefecture]
    @cities = Heartrails::GeoAPI.get_cities(prefecture)
    render json: @cities
  end

  def create
  @result = Result.new(result_params)
  @result.member_id = current_member.id

    if @result.save
      redirect_to member_result_show_path(@result), notice: "釣果を投稿しました"
    else
      @prefectures = Heartrails::GeoAPI.get_prefectures
      render :new, notice: "釣果が正常に投稿されませんでした。"
    end
  end

  def edit
    @result = Result.find(params[:id])
    @prefectures = Heartrails::GeoAPI.get_prefectures
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

    if @result.member_id == current_member.id
    @result.destroy
      redirect_to member_mypage_path(current_member.id), notice: "削除しました。"
    else
    # 所有者でない場合のエラー処理
      redirect_to member_mypage_path(current_member.id), notice: "他会員の投稿を削除する事は出来ません。"
    end
  end

  private

  def result_params
    params.require(:result).permit(:title, :body, :name, :point, :genre_id, :time, :weather, :tide, :tide_updown, :wave, :light, :prefecture, :city, :moon, result_images: [])
  end

end
# require 'net/http'
# require 'uri'
# require 'json'
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
    #@prefectures = get_prefectures
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
    params.require(:result).permit(:title, :body, :name, :point, :genre_id, :time, :weather, :tide, :tide_updown, :wave, :light, :prefecture, :city, :moon, result_images: [])
  end

  # def get_prefectures
  #   uri = URI.parse('https://geoapi.heartrails.com/api/json?method=getPrefectures')
  #   response = Net::HTTP.get_response(uri)
  #   if response.code == '200'
  #     JSON.parse(response.body)['response']['prefecture']
  #   else
  #     []
  #   end
  # end

  # def get_cities(prefecture_name)
  #   return [] if prefecture_name.blank?

  #   encoded_prefecture_name = ERB::Util.url_encode(prefecture_name)
  #   uri = URI.parse("https://geoapi.heartrails.com/api/json?method=getCities&prefecture=#{encoded_prefecture_name}")
  #   response = Net::HTTP.get_response(uri)
  #   if response.code == '200'
  #     JSON.parse(response.body)['response']['city']
  #   else
  #     []
  #   end
  # end
end
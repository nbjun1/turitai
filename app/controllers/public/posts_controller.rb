class Public::PostsController < ApplicationController

  before_action :set_post, only: [:show]

  def new
    @post = Post.new
  end

  def create
    if params[:post].present?
      @post = Post.new(post_params)
      tags = Vision.get_image_data(post_params[:image])
      if @post.save
        tags.each do |tag|
          @post.tags.create(name: tag)
        end
        redirect_to image_show_path(@post.id)
      else
        render :new
      end
    else
      flash[:notice] = '画像を選択してください'
      redirect_to image_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
    flash[:notice] = "指定された投稿が見つかりません。"
    redirect_to root_path
    elsif @post.created_at < 5.minutes.ago
    flash[:notice] = "投稿は既に削除されました。"
    redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:image)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end

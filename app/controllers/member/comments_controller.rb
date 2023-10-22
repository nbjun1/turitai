class Member::CommentsController < ApplicationController

  def create
    @result = Result.find(params[:result_id])
    @comment = current_member.comments.new(comment_params)
    @comment.result_id = @result.id
    @comment.save
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @result = @comment.result

    if @comment.member_id == current_member.id
     @comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

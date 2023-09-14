class Member::CommentsController < ApplicationController

  def create
    result = Result.find(params[:result_id])
    comment = current_member.comments.new(comment_params)
    comment.result_id = result.id
    comment.save
    redirect_to member_result_show_path(result)
  end

  def destroy
    current_member.comments.find(params[:id]).destroy
    redirect_to member_result_show_path, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

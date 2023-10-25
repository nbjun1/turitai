class Admin::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path, notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :is_withdrawal)
  end

end

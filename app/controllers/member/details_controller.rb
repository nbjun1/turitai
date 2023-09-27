class Member::DetailsController < ApplicationController

   before_action :ensure_guest_member, only: [:edit]

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member.id)
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_mypage_path(@member.id), notice: "登録情報を変更しました"
    else
      render :edit
    end
  end

  def confirm
    @member = Member.find(current_member.id)
  end

  def withdrawal
    @member = Member.find(current_member.id)
    @member.update(is_withdrawal: true)
    reset_session
    redirect_to root_path, notice: "退会しました。"
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image, :email, :is_withdrawal)
  end

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.guest_member?
      redirect_to member_mypage_path(member), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end

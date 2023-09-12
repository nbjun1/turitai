class Member::DetailsController < ApplicationController
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "商品情報を変更しました"
      redirect_to member_mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image, :email, :is_withdrawal)
  end

end

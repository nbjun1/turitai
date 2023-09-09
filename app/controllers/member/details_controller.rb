class Member::DetailsController < ApplicationController
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def confirm
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image, :email, :is_withdrawal)
  end

end

# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController

  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to member_mypage_path(member), notice: "ゲスト会員でログインしました。"
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def after_sign_in_path_for(resource)
    member_mypage_path(current_member.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end

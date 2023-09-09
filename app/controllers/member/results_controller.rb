class Member::ResultsController < ApplicationController
  def index
    @member = current_member
  end

  def show
  end

  def new
  end

  private

  def result_params
    params.require(:result).permit()
  end
end

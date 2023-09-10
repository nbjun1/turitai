class Member::ResultsController < ApplicationController
  def index
    @member = current_member
  end

  def show
  end

  def new
    @result = Result.new
  end
  
  def create
    @result.save
  end

  private

  def result_params
    params.require(:result).permit(:title, :body, :image)
  end
end

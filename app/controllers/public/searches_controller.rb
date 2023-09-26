class SearchesController < ApplicationController
  
  def search
    @raenge = params[:range]
    @word = params[:word]
    if @range == "Result"
      @results = Result.looks(params[:search], params[:word])
    else
      @areas = Area.looks(params[:search], params[:word])
      @area_details = AreaDetail.looks(params[:search], params[:word])
    end
  end
end

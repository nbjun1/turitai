class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]
    @prefecture = params[:prefecture]
    @city = params[:city]

      if @range == "Result"
      @results = Result.looks(params[:search], @word, @prefecture, @city)
      elsif @range == "Result"
      @results = Prefecture.looks(params[:search], @prefecture)
      elsif @range == "Result"
      @results = City.looks(params[:search], @city)
      end

    # @results が nil の場合にデフォルトの空の配列を設定
    @results ||= []
  end

  def keysearch
    # キーワード検索を行う前に @search_result を初期化
    @search_result = []

    if params[:search]
      # キーワード検索を実行
      @search_result = Result.search(params[:search], params[:range])
      @results = @search_result.page(params[:page])
      @results_count = @search_result.count
    end
  end
end

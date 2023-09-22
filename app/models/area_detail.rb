class AreaDetail < ApplicationRecord

  belongs_to :result

  def self.looks(search, word)
    if search == "perfect_match"
      @area_detail = AreaDetail.where("detail_name LIKE?","#{word}")
    elsif search == "partial_match"
      @area_detail = AreaDetail.where("detail_name LIKE?","%#{word}%")
    else
      @area = Area.all
    end
  end
end

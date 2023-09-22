class Area < ApplicationRecord

  belongs_to :result
  
  def self.looks(search, word)
    if search == "perfect_match"
      @area = Area.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @area = Area.where("name LIKE?","%#{word}%")
    else
      @area = Area.all
    end
  end

end

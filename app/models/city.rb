class City < ApplicationRecord

  belongs_to :result

  def self.looks(search, word)
    if search == "perfect_match"
      @city = City.where("detail_name LIKE?","#{word}")
    elsif search == "partial_match"
      @city = City.where("detail_name LIKE?","%#{word}%")
    else
      @city = City.all
    end
  end
end

class Prefecture < ApplicationRecord

  belongs_to :result

  def self.looks(search, word)
    if search == "perfect_match"
      @prefecture = Prefecture.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @prefecture = Prefecture.where("name LIKE?","%#{word}%")
    else
      @prefecture = Prefecture.all
    end
  end

end

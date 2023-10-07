class Prefecture < ApplicationRecord

  has_many :results
  validates :prefecture, presence: true
  
  def self.looks(search, word)
    if search == "perfect_match"
      @prefecture = Prefecture.where("prefecture LIKE?","#{word}")
    elsif search == "partial_match"
      @prefecture = Prefecture.where("prefecture LIKE?","%#{word}%")
    else
      @prefecture = Prefecture.all
    end
  end

end

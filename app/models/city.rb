class City < ApplicationRecord

  belongs_to :prefecture
  has_many :results
  validates :city, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @city = City.where("city LIKE?","#{word}")
    elsif search == "partial_match"
      @city = City.where("city LIKE?","%#{word}%")
    else
      @city = City.all
    end
  end
end

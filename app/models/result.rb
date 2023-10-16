class Result < ApplicationRecord

  belongs_to :member
  belongs_to :genre
  #belongs_to :prefecture
  #belongs_to :city
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :result_images

  validates :title, presence: true
  validates :body, presence: true
  validates :name, presence: true

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

  enum time: { morning_mazume: 0, day_time: 1, evening_mazume: 2, night_time: 3 }
  enum weather: { sunny: 0, cloudy: 1, rain: 2, snow: 3, }
  enum tide: { spring_tide: 0, middle_tide: 1, neap_tide: 2, nagasio: 3, wakasio: 4 }
  enum tide_updown: { up_tide: 0, high_tide: 1, down_tide: 2, low_tide: 3 }
  enum wave: { wave0m: 0, wave05m: 1, wave10m: 2, wave15m: 3 }
  enum light: { presence: 0, absence: 1 }

  def self.looks(search, word, prefecture, city)
    if search == "perfect_match"
      @result = Result.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @result = Result.where("name LIKE?","%#{word}%")
    else
      @result = Result.all
    end
  end

  def self.search(keyword, range)
  results = self.all
  if keyword.present?
    if range == 'name'
     results = results.where("name LIKE ?", "%#{keyword}%")
    end

    if range == 'prefecture'
     results = results.where("prefecture LIKE ?", "%#{keyword}%")
    end

    if range == 'city'
     results = results.where("city LIKE ?", "%#{keyword}%")
    end
  end

  results
  end
end

class Result < ApplicationRecord

  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :result_images

  validates :title, presence: true
  validates :body, presence: true

  enum time: { morning_mazume: 0, day_time: 1, evening_mazume: 2, night_time: 3 }
  enum weather: { sunny: 0, cloudy: 1, rain: 2, snow: 3, }
  enum tide: { spring_tide: 0, middle_tide: 1, neap_tide: 2, nagasio: 3, wakasio: 4 }
  enum tide_updown: { up_tide: 0, high_tide: 1, down_tide: 2, low_tide: 3 }
  enum wave: { wave0m: 0, wave05m: 1, wave10m: 2, wave15m: 3 }
  enum light: { yes: 0, no: 1 }

  def get_result_images(width, height)
    unless result_images.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      result_images.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    result_images.variant(resize_to_fill: [width, height], gravity: :center).processed
  end

end

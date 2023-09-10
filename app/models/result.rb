class Result < ApplicationRecord
  belongs_to :member
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :result_image

  validates :title, presence: true
  validates :body, presence: true

end

class Result < ApplicationRecord

  belongs_to :member

  has_many_attached :result_image

end

class Genre < ApplicationRecord

  has_many :result
  validates :method, presence: true, uniqueness: true

end
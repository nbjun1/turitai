class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :result
  validates :comment, presence: true
end

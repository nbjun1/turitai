class Favorite < ApplicationRecord
  belongs_to :result
  belongs_to :member
end

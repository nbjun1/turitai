class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :result
  varidate :comment,presence:true　　
end

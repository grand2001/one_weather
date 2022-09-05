class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :item

validates :comment, presence: true, length: { minimum: 1, maximum: 40 }
end

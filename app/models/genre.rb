class Genre < ApplicationRecord
 has_many :items, through: :item_genres
 has_many :item_genres, dependent: :destroy

 validates :name, presence: true, length: { minimum: 1, maximum: 7 }

end
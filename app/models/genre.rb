class Genre < ApplicationRecord

 has_many :items, through: :item_genres
 has_many :item_genres, dependent: :destroy

 validates :name, presence: true, length: { minimum: 1, maximum: 7 , message: 'は1字以上7字以下で入力してください'}

end
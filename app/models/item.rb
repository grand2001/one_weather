class Item < ApplicationRecord
 has_one_attached :image, dependent: :destroy
 has_many :comments, dependent: :destroy
 belongs_to :genre
 belongs_to :customer
 has_many :favorites, dependent: :destroy
 has_many :item_genres, dependent: :destroy

 validates :genre_id, presence: true
 validates :introduction, presence: true, length: { minimum: 5, maximum: 30 }
 validates :name, presence: true, length: { minimum: 1, maximum: 10 }

 def self.looks(search, word)
   customer_ids = Customer.where(is_deleted: true)
  if search == "perfect_match"
    @item = Item.where("name LIKE?", "#{word}").where.not(customer_id: customer_ids)
  elsif search == "partial_match"
    @item = Item.where("name LIKE?","%#{word}%").where.not(customer_id: customer_ids)
  else
    @item = Item.all
  end
 end

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end

end
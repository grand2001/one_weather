class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 10 , message: 'は1字以上10字以下で入力してください'}
  validates :email, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end

  scope :ture_customer, -> { where(is_deleted: false) }


end
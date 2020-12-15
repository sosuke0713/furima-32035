class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email
    validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :family_hurigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_hurigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :nickname  
    validates :birth
  end

  has_many :items
  has_many :buyers
   
end

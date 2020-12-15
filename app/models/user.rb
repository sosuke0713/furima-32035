class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :familyname, presence: true
  validates :family_hurigana, presence: true
  validates :firstname, presence: true
  validates :first_hurigana, presence: true
  validates :nickname, presence: true 
  validates :birth, presence: true

  has_many :items
  has_many :buyers
   
end

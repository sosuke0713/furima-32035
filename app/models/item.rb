class Item < ApplicationRecord
  
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :state
  belongs_to_active_hash :shippingdate

  with_options presence: true do
    validates :image
    validates :title
    validates :comments
    with_options numericality: { other_than: 0} do
      validates :category_id
      validates :status_id
      validates :deliveryfee_id
      validates :state_id
      validates :shippingdate_id
    end

    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end


  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end

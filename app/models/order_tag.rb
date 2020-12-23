class OrderTag

  include ActiveModel::Model
  attr_accessor :post_code, :city, :house_number, :building_name, :phone_number, :buyer_id, :state_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "number Input only number"}
   #郵便番号に関するバリデーション
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "code Input correctly"}
   #都道府県に関するバリデーション
   validates :state_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # 購入の情報を保存
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, state_id: state_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end

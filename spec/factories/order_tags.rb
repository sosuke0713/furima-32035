FactoryBot.define do
  factory :order_tag do
    post_code { '123-4567' }
    state_id      { 2 }
    city { '名古屋市' }
    house_number { '1-3-5' }
    building_name { 'ブローテ東印場' }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk11111111111111111"}
    item_id  {2}
    user_id  {2}
  end
end

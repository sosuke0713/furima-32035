FactoryBot.define do
  factory :item do

    association :user

    title              {"test"}
    price              {1000}
    category_id        {2}
    status_id             {2}
    deliveryfee_id        {2}
    state_id              {2}
    shippingdate_id       {2}
    comments               {"プレミアムな商品でおすすめです。"}
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

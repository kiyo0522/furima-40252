FactoryBot.define do
  factory :item do
    title                { '出品商品' }
    title_description    { '出品商品の説明' }
    category_id          {  2  }
    condition_id         {  2  }
    shipp_fee_id         {  2  }
    prefecture_id        {  2  }
    shipp_date_id        {  2  }
    price                { 400 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

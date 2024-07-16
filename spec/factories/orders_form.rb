FactoryBot.define do
  factory :order_form do
    post_code            { '123-4567' }
    prefecture_id        { 2 }
    city                 { '名古屋市西区' }
    block                { '1-1-1' }
    building             { 'ディアレイシャス101' }
    phone                { '0901234567' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end

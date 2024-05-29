FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 6)}a1" }
    password_confirmation { password }
    first_name            { '太郎たろうタロウ' }
    last_name             { '山田やまだヤマダ' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end

# password{ Faker::Internet.password(min_length: 6) + 'a1' }

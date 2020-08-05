FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { 'aaa@sample.com' }
    password              { '111aaa' }
    password_confirmation { '111aaa' }
  end
end

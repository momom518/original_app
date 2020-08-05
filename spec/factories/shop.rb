FactoryBot.define do
  factory :shop do
    company_name              { 'スーパーAAA' }
    shop_name                 { '千葉中央店' }
    image                     { Rack::Test::UploadedFile.new('spec/fixtures/sample.jpg') }
    postal_code               { '123-4567' }
    prefecture_id             { '13' }
    address                   { '千葉市1-1-1' }
    business_hour             { '9:00-22:00' }
    tell                      { '0120111222' }
    user
  end
end

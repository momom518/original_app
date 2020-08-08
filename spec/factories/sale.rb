FactoryBot.define do
  factory :sale do
    image                     { Rack::Test::UploadedFile.new('spec/fixtures/sample.jpg') }
    heading                   {'夕方５時からの夕市セール！！'}
    info                      {'だいこん、キャベツ、ほうれんそう全品９８円です。'}
    caution                   {'お人家族様各一個限りです。'}
    day                       {'2020-08-03'}
    start_time                {'05:30:00'}
    end_time                  {'10:00:00'}
    department_id             {2}
    shop
  end
end

FactoryGirl.define do
  factory :post do
    description 'nofilter'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/welcome.jpg', 'image/jpg')
    user_id 1
  end
end

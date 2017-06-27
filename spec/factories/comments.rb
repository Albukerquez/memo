FactoryGirl.define do
  factory :comment do
    id 1
    content 'Nice post <3'
    user_id 1
    post_id 1
  end
end

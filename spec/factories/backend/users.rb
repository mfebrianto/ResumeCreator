FactoryGirl.define do
  factory :user do |f|
    f.email 'michaelfebriantoTest1@gmail.com'
    f.password 'passw0rd'
    f.password_confirmation {'passw0rd'}
  end
end
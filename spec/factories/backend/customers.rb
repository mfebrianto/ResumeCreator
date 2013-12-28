require 'faker'

FactoryGirl.define do
  factory :backend_customer, class: Backend::Customer do |f|
    f.email {Faker::Internet.email}
  end
end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :backend_design, :class => 'Backend::Design' do
    name "MyString"
  end
end

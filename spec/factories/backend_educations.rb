# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :backend_education, :class => 'Backend::Education' do
    activities "MyString"
    degree "MyString"
    end_date "2014-01-05 00:09:32"
    field_of_study "MyString"
    notes "MyString"
    school_name "MyString"
    start_date "2014-01-05 00:09:32"
  end
end

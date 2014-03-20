FactoryGirl.define do
  factory :user_customer do |f|
    f.email 'customer@gmail.com'
    f.password 'passw0rd'
    f.password_confirmation {'passw0rd'}
  end


  factory :user_designer do |f|
    f.email 'designer@gmail.com'
    f.password 'passw0rd'
    f.password_confirmation {'passw0rd'}
  end

  factory :user_customer_with_roles, :parent => :user_customer do
    after_create do |customer_role|
      FactoryGirl.create(:role_customer, :user_customer => customer_role)
    end
  end

  factory :user_designer_with_roles, :parent => :user_designer do
    after_create do |designer_role|
      FactoryGirl.create(:role_designer, :user_designer => designer_role)
    end
  end


end
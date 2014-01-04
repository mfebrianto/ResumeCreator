class Backend::Customer < ActiveRecord::Base
  has_many :backend_education, class_name: Backend::Education, foreign_key: 'backend_customer_id'
end

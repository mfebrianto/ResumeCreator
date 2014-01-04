class Backend::Education < ActiveRecord::Base
  belongs_to :backend_customer, class_name: Backend::Customer, foreign_key: 'backend_customer_id'
end

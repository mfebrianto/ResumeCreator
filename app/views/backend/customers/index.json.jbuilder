json.array!(@backend_customers) do |backend_customer|
  json.extract! backend_customer, :id, :email, :first_name, :last_name
  json.url backend_customer_url(backend_customer, format: :json)
end

require 'test_helper'

class Backend::CustomersControllerTest < ActionController::TestCase
  setup do
    @backend_customer = backend_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_customer" do
    assert_difference('Backend::Customer.count') do
      post :create, backend_customer: { email: @backend_customer.email, first_name: @backend_customer.first_name, last_name: @backend_customer.last_name }
    end

    assert_redirected_to backend_customer_path(assigns(:backend_customer))
  end

  test "should show backend_customer" do
    get :show, id: @backend_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_customer
    assert_response :success
  end

  test "should update backend_customer" do
    patch :update, id: @backend_customer, backend_customer: { email: @backend_customer.email, first_name: @backend_customer.first_name, last_name: @backend_customer.last_name }
    assert_redirected_to backend_customer_path(assigns(:backend_customer))
  end

  test "should destroy backend_customer" do
    assert_difference('Backend::Customer.count', -1) do
      delete :destroy, id: @backend_customer
    end

    assert_redirected_to backend_customers_path
  end
end

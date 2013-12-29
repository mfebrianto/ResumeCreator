require 'spec_helper'

describe "customer data api" do
  it "can be accessed using api and email" do
    user_registration
    user = User.last
    visit "/api/v1/customers.json?email=#{user.email.downcase}&api_key=#{user.api_key.downcase}"
    expect(page.status_code).to eq(200)
  end

  it "cannot be accessed using api only" do
    user_registration
    user = User.last
    visit "/api/v1/customers.json?api_key=#{user.api_key.downcase}"
    expect(page.status_code).to eq(401)
  end
end
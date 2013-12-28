require 'spec_helper'

describe Backend::Customer do
  it "has valid email" do
    FactoryGirl.create(:backend_customer).should be_valid
  end
end
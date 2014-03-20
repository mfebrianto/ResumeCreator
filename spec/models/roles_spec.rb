require 'spec_helper'

describe "Roles" do

  it "should have customer" do
    expect(Role.where(name:'customer')).to exist
  end

  it "should have designer" do
    expect(Role.where(name:'designer')).to exist
  end
end
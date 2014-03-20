require 'spec_helper'

describe "RegistrationsController" do

  it "open sign up page" do
    visit new_user_registration_path
    page.should have_content('Email')
    page.should have_content('Password')
    page.should have_content('Password Confirmation')
  end

  it "sign up as designer" do

  end

  it "sign in page should have email and password" do
    visit new_user_session_path
    page.should have_content('Email')
    page.should have_content('Password')
  end

  it "should be able to sign in as customer" do
    visit new_user_session_path
    fill_in 'Email', with: 'customer@gmail.com'
    fill_in 'Password', with: 'passw0rd'
    click_button 'Sign in'
    page.should have_link 'Sign out'
  end

end
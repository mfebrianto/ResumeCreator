require 'spec_helper'


describe "RegistrationsController" do

  it "sign up page" do
    visit new_user_registration_path
    page.should have_content('Email')
    page.should have_content('Password')
  end

  it "sign up as designer" do

  end

  it "sign up as customer" do
    visit new_user_registration_path
    fill_in 'Email', with: 'customer@gmail.com'
    fill_in 'Password', with: 'passw0rd'
    fill_in 'Password confirmation', with: 'passw0rd'
  end

  it "sign in page should have email and password" do
    visit new_user_session_path
    page.should have_content('Email')
    page.should have_content('Password')
  end

  it "sign in as customer" do
    visit new_user_session_path
    fill_in 'Email', with: 'customer@gmail.com'
    fill_in 'Password', with: 'passw0rd'
    click_button 'Sign in'
    page.should have_link 'Sign out'
  end

end
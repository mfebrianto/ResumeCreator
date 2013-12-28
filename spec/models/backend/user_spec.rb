require 'spec_helper'


describe 'User Registration' do
  it 'allows user to register' do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
      fill_in   'Email', with: user.email
      fill_in   'Password', with: user.password
      fill_in   'Password confirmation', with: user.password
      click_button 'Sign up'
    email = ActionMailer::Base.deliveries.last
    expect(email.to.at(0)).to eq(user.email.downcase)
    expect(email.subject).to eq('Confirmation instructions')
  end
end
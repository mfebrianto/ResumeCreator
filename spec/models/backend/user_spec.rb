require 'spec_helper'

def user_registration
  user = FactoryGirl.build(:user)
  visit new_user_registration_path
  fill_in   'Email', with: user.email
  fill_in   'Password', with: user.password
  fill_in   'Password confirmation', with: user.password
  click_button 'Sign up'
  return user
end

describe 'User Registration' do
  it 'sends confirmation email' do
    user = user_registration
    email = ActionMailer::Base.deliveries.last
    expect(email.to.at(0)).to eq(user.email.downcase)
    expect(email.subject).to eq('Confirmation instructions')
  end

  it 'creates api_key' do
    user_registration
    expect(User.last.api_key).not_to be_nil
  end

end


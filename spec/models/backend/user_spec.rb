require 'spec_helper'


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


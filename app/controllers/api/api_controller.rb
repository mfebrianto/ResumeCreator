class Api::ApiController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :restrict_access

  private

  def restrict_access
    api_key = User.find_by_email_and_api_key(params[:email],params[:api_key])
    head :unauthorized unless api_key
  end

end
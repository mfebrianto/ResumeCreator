class RegistrationsController < Devise::RegistrationsController

  def new

    #get access token
    if params[:code]
      response = RestClient.get 'https://www.linkedin.com/uas/oauth2/accessToken', {:params => {:grant_type => 'authorization_code', :code => params[:code], :redirect_uri => 'http://localhost:3000/users/sign_up', :client_id => '75yhpntmdw2vi9', :client_secret => 'j5XlET79axKLm4nL'}}

      #parse access token
      access_token_response = JSON.parse(response)
      #Rails.logger.info "access token : #{access_token_response['access_token']}"
      #Rails.logger.info "expires in : #{access_token_response['expires_in']}"
    end

    #get new user email
    response  = RestClient.get 'https://api.linkedin.com/v1/people/~/email-address', {:params => {:oauth2_access_token => access_token_response['access_token'], :format => 'json'}}
    response_email = response.to_s.tr('"','')
    #Rails.logger.info "email : #{response}"
    #Rails.logger.info "email : #{response_email}"

    #save email and access token first
    @linkedinData = LinkedinData.find_or_initialize_by(email:response_email)
    @linkedinData.update(access_token:access_token_response['access_token'])
    if @linkedinData.save
      @user = User.new(email: response_email)
    else
      #TODO: save me!
    end
  end

  def create
    #TODO: check LinkedData first

    @user = User.new(user_params)
    #create roles
    @Role = Role.find_by_name('customer')
    @user.roles.concat(@Role)

    Rails.logger.info ">>>>>>1"
    if @user.save
      Rails.logger.info ">>>>>>2"
      sign_in @user
    end
  end

  def update
    super
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end


end
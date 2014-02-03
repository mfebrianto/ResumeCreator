class Backend::CustomersController < ApplicationController

  respond_to :html

  before_filter :authenticate_user!, except: [:new]

  before_action :set_backend_customer, only: [:show, :edit, :update, :destroy]


  def index
    @backend_customers = Backend::Customer.all
  end

  def show
  end

  # GET /backend/customers/new
  def new
    #@backend_customer = Backend::Customer.new
    #to get all params
    #params.each do |key,value|
    #  Rails.logger.info "Param #{key}: #{value}"
    #end
  end

  # GET /backend/customers/1/edit
  def edit
  end

  # POST /backend/customers
  # POST /backend/customers.json
  def create
    @backend_customer = Backend::Customer.new(backend_customer_params)

    respond_to do |format|
      if @backend_customer.save
        format.html { redirect_to @backend_customer, notice: 'Customer was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /backend/customers/1
  # PATCH/PUT /backend/customers/1.json
  def update
    respond_to do |format|
      if @backend_customer.update(backend_customer_params)
        format.html { redirect_to @backend_customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /backend/customers/1
  # DELETE /backend/customers/1.json
  def destroy
    @backend_customer.destroy
    respond_to do |format|
      format.html { redirect_to backend_customers_url }
    end
  end

  def complete_profile

    #get access_token
    @linkedin_data = LinkedinData.find_by(email:current_user.email)

    #get all data
    response = RestClient.get 'https://api.linkedin.com/v1/people/~:(first-name,last-name,headline,picture-url)', {:params => {:oauth2_access_token => @linkedin_data.access_token, :format => 'json'}}

    #parse access token
    full_data_response = JSON.parse(response)
    @backend_customer = Backend::Customer.find_or_initialize_by(user_id:current_user)
    @backend_customer.update(first_name: full_data_response['firstName'], last_name: full_data_response['lastName'], picture_url: full_data_response['pictureUrl'], user_id: current_user.id)
    if @backend_customer.save
      redirect_to backend_welcome_index_url
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_customer
      @backend_customer = Backend::Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_customer_params
      params.require(:backend_customer).permit(:email, :first_name, :last_name)
    end
end

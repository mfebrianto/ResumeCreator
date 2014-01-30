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

    #get access token
    if params[:code]
      response = RestClient.get 'https://www.linkedin.com/uas/oauth2/accessToken', {:params => {:grant_type => 'authorization_code', :code => params[:code], :redirect_uri => 'http://localhost:3000/backend/customers/new', :client_id => '75yhpntmdw2vi9', :client_secret => 'j5XlET79axKLm4nL'}}

      #parse access token
      new_response = JSON.parse(response)
      Rails.logger.info "access token : #{new_response['access_token']}"
      Rails.logger.info "expires in : #{new_response['expires_in']}"
    end

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

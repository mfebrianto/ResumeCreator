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
    response = RestClient.get 'https://api.linkedin.com/v1/people/~:(first-name,last-name,headline,picture-url,educations,three-current-positions,three-past-positions)', {:params => {:oauth2_access_token => @linkedin_data.access_token, :format => 'json'}}

    #view all
    full_data_response = JSON.parse(response)
    education_response = (full_data_response['educations'])['values']
    three_current_positions = (full_data_response['threeCurrentPositions'])['values']
    three_past_positions = (full_data_response['threePastPositions'])['values']
    Rails.logger.info ">>>>>>#{three_past_positions}"

    #parse access token
    @backend_customer = Backend::Customer.find_or_initialize_by(user_id:current_user)
    unless full_data_response['pictureUrl'].blank?
      @backend_customer.photo_from_url full_data_response['pictureUrl']
    end

    @backend_customer.update(first_name: full_data_response['firstName'], last_name: full_data_response['lastName'], picture_url: full_data_response['pictureUrl'], user_id: current_user.id)
    if @backend_customer.save

      #parse educations
      education_response.each do |object|
        @backend_education = Backend::Education.find_or_initialize_by(id:object['id'])
        #Rails.logger.info ">>>>>>>#{start_date}"
        @backend_education.update(backend_customer_id:@backend_customer.id, activities:object['activities'], degree: object['degree'], end_date:parse_timestamp(object['endDate']) , field_of_study:object['fieldOfStudy'], notes:object['notes'],school_name:object['schoolName'],start_date:parse_timestamp(object['startDate']))
        @backend_education.save
      end

      #parse three current positions
      unless three_current_positions.blank?
        check_current_position(three_current_positions)
      end

      #parse three past positions
      unless three_past_positions.blank?
        check_past_position(three_past_positions)
      end


    end

    render action: 'show'

  end

  def check_current_position(three_current_positions)
    three_current_positions.each do |position|
      @backend_position = Backend::Position.find_or_initialize_by(id:position['id'])
      @backend_position.update(backend_customer_id:@backend_customer.id, industry:(position['company'])['industry'], name:(position['company'])['name'], size:(position['company'])['size'], company_type:(position['company'])['type'], start_date:parse_timestamp(position['startDate']), end_date:parse_timestamp(position['endDate']), summary:position['summary'], title:position['title'])
      @backend_position.save
    end
  end

  def check_past_position(three_past_positions)
    three_past_positions.each do |position|
      @backend_position = Backend::Position.find_or_initialize_by(id:position['id'])
      @backend_position.update(backend_customer_id:@backend_customer.id, industry:(position['company'])['industry'], name:(position['company'])['name'], size:(position['company'])['size'], company_type:(position['company'])['type'], start_date:parse_timestamp(position['startDate']), end_date:parse_timestamp(position['endDate']), summary:position['summary'], title:position['title'])
    @backend_position.save
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

    def parse_timestamp(the_date)
      unless the_date.nil?
        Date.parse((the_date['year']).to_s+'-01-01 00:00:00 UTC')
      end
    end
end

class Api::V1::CustomersController < Api::ApiController

  before_filter :restrict_access

  respond_to :json

  def index
    @backend_customers = Backend::Customer.all
    respond_with @backend_customers
  end


  def show
  end


  def create
    @backend_customer = Backend::Customer.new(backend_customer_params)

    respond_to do |format|
      if @backend_customer.save
        format.json { render json: @backend_customer, status: :created }
      else
        format.json { render json: @backend_customer.errors, status: :unprocessable_entity }
      end
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

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

end
class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to @payment
    else 
      render 'new'
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private
    def payment_params
      params.require(:payment).permit(:total, :currency)
    end

end


class Api::User::V1::PaymentsController < Api::User::V1::BaseController

  before_action :authenticate_request!

  def create
    begin
      req = ::User::PaymentRequest.new(payment_params)
      req.user_id = @current_user.id
      if req.valid?(:create)
        payment = service.make_payment(req)
        success("Transaction has been done successfully.")
      else
        errors(req.errors , message = "Transaction failed.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  private

  def payment_params
    params.permit(:amount, :token, :reason)
  end

  def service
    @service ||= PaymentService.new
  end

end

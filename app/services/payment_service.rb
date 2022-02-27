class PaymentService < BaseService

  def find(id)
    Payment.find(id)
  end

  def find_by_id(id)
    Payment.find_by_id(id)
  end

  def make_payment(req)
    payment = create(req)
    card_service.deduct_amount(req.card_id, req.amount)
    return payment
  end

  def create(req)
    Payment.create!(
      card_id: req.card_id,
      amount: req.amount,
      reason: req.reason
    )
  end

  def user_service
    @user_service ||= UserService.new
  end

  def card_service
    @card_service ||= CardService.new
  end
end

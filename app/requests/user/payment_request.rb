class User::PaymentRequest < User::UserCommonRequest

  attr_accessor :token, :amount, :reason, :user_id, :card_id

  validates :token, :amount, presence: true, on: [:create] 
  validate :is_valid_card_with_amount, on: [:create] 

  private

  def is_valid_card_with_amount
    user = user_service.find(self.user_id)
    card = card_service.find_by_token(self.token)
    self.card_id = card.id if card.present?

    if card.blank? || (user.cards.exclude? card)
      return errors.add(:token, 'Invalid token.')
    elsif card.available_balance < self.amount.to_f
      return errors.add(:amount, 'Insufficient balance.')
    end
  end

  def service
    @service ||= PaymentService.new
  end

  def user_service
    @user_service ||= UserService.new
  end

  def card_service
    @card_service ||= CardService.new
  end

end

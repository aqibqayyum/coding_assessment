class CardService < BaseService

  def find(id)
    Card.find(id)
  end

  def find_by_id(id)
    Card.find_by_id(id)
  end

  def find_by_token(token)
    Card.find_by_token(token)
  end

  def add(req)
    card = create(req)
    mark_default(card, req.is_default)
    return card
  end

  def create(req)
    Card.create!(
      user_id: req.user_id,
      holder_name: req.holder_name,
      card_no: req.card_no,
      expiry_month: req.expiry_month,
      expiry_year: req.expiry_year,
      token: generate_token
    )
  end

  def mark_default(card, is_default)
    active_card = user_service.user_active_card(card.user)
    if active_card.blank?
      card.update_column(:is_default, true)
    elsif is_default == "true"
      active_card.update_column(:is_default, false)
      card.update_column(:is_default, true)
    end
  end

  def all
    Card.all
  end

  def available_balance(card)
    card.available_balance
  end

  def random_string
    SecureRandom.hex
  end

  def generate_token
    token = random_string
    if find_by_token(token)
      token = random_string
    end
    return token
  end

  def deduct_amount(id, amount)
    card = find(id)
    card.update_column(:available_balance, (card.available_balance - amount.to_f ))
  end

  def user_service
    @user_service ||= UserService.new
  end
end

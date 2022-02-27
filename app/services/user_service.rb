class UserService < BaseService

  def find(id)
    User.find(id)
  end

  def find_by_id(id)
    User.find_by_id(id)
  end

  def find_by_email(email)
    User.where('lower(email) = ?', email.downcase).take
  end

  def signup(request)
    create(request)
  end

  def create(request)
    User.create(
      first_name: request.first_name,
      last_name: request.last_name,
      email: request.email,
      password: request.password
    )
  end

  def user_active_card(user)
    user.cards.where(is_default: true).take
  end

end

class User::SignupRequest < User::UserCommonRequest

  attr_accessor :first_name, :last_name, :email, :password, :confirm_password

  validates :first_name ,:last_name, :email, :password, :confirm_password, presence: true, on: [:signup] 
  validate :unique_email_update, on: [:signup]
  validate :match_confirm_password, on: [:signup]

  def unique_email_update
    if self.email
      user = service.find_by_email(self.email)
      return errors.add(:email, 'already exists.') if user
    end
  end

  def match_confirm_password
    if self.password != self.confirm_password
      return errors.add(:confirm_password, 'password and confirm password did not match.')
    end
  end

  private

  def service
    @service ||= UserService.new
  end

end

class User::AuthRequest < CommonRequest

  attr_accessor :email, :password

  validates :email, :password, presence: true, on: [:login]
  # validates :email, presence: true, on: [:forgot_password]
  # validates :email, :reset_password_code, :password, :confirm_password, presence: true, on: [:update_password]
  # validate  :match_confirm_password, on: [:update_password]
  # validates :first_name, :last_name, presence: true, on: [:update_profile]
  # validates :avatar, presence: true, on: [:update_avatar]

  # def match_confirm_password
  #   if self.password != self.confirm_password
  #     return errors.add(:confirm_password, 'password and confirm password did not match.')
  #   end
  # end

  # private

  # def service
  #   @service ||= Customer::AuthService.new
  # end

end

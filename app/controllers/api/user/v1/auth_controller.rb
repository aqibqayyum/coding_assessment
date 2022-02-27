class Api::User::V1::AuthController < Api::User::V1::BaseController

  before_action :authenticate_request!, only: [:test_authen]
#===========================Swagger Start=======================================
  # swagger_controller :auth, 'Auth'
  # swagger_api :login do
  #   param :form, :email, :string, :optional, "Email"
  #   param :form, :password, :string, :optional, "Password"
  #   response :unauthorized
  #   response :not_acceptable
  # end

  # swagger_api :logout do
  #   param :header ,'Authorization', :string, :required, 'Authentication token'
  #   response :unauthorized
  #   response :not_acceptable
  # end

  # swagger_api :signup do
  #   param :form, :first_name, :string, :required, "First Name"
  #   param :form, :last_name, :string, :required, "Last Name"
  #   param :form, :contact_no, :string, :required, "Contact No"
  #   param :form, :email, :string, :required, "email"
  #   param :form, :password, :string, :required, "password"
  #   param :form, :confirm_password, :string, :required, "Confirm Password"
  #   response :unauthorized
  #   response :not_acceptable
  # end


#===========================Swagger End=========================================
  def login
    begin
      req = ::User::AuthRequest.new(login_params)
      if req.valid?(:login)
        user = set_customer
        sign_in user
        success("Logged in successfuly.")
      else
        errors(request.errors , message = "Failed to perform login.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  # def logout
  #   if params[:device_token].present?
  #     request = ::User::AuthRequest.new(logout_params)
  #     request.customer_id = @current_customer.id
  #     service.delete_customer_device(request)
  #   else
  #     service.delete_customer_devices(@current_customer)
  #   end
  #   sign_out @current_customer
  #   success("logout successfuly.")
  # end

  def signup
    begin
      signup_request = ::User::SignupRequest.new(signup_params)
      if signup_request.valid?(:signup)
        user = service.signup(signup_request)
        render(json: user, serializer: SignupSerializer)
      else
        errors(signup_request.errors , message = "Failed to perform signup.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  def test_authen
    byebug
  end

  private

  def set_customer
    user = User.find_for_database_authentication(email: login_params[:email])
    return user if user.present? and user.valid_password?(login_params[:password])
    raise "Incorrect email/password combination. Please try again."
  end

  def send_token(token)
    @signin_response = []
    @signin_response << @user
    @signin_response << {"header" => token}
  end

  def signup_params
    params.permit(:first_name, :last_name, :email, :password, :confirm_password)
  end

  def login_params
    params.permit(:email, :password)
  end

  def service
    @service ||= UserService.new
  end

end

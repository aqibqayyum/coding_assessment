class Api::User::V1::BaseController < Api::ApiController
  require 'jwt'
  require 'jsonwebtoken'

  def success(message)
    render(json: {message: message, code: 200}, status:  200)
  end

  def failur(message)
    render(json: {message: message, code: 400}, status:  400)
  end

  def errors(errors, message)
    render(json: {code: 400, message: message, errors: errors}, status: 400)
  end

  def exception(message, code)
    render(json: {message: message, code: code}, status:  500)
  end

  protected

  def authenticate_request!
    return invalid_authentication if !payload
    load_current_user!
    return invalid_authentication unless @current_user
  end

  def invalid_authentication
    render json: {error: 'Invalid Token', message: "Please login to continue."}, status: :unauthorized
  end

  private

  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    @decoded_auth_token=JsonWebToken.decode(token)
  rescue
    nil
  end

  def load_current_user!
    @current_user = User.find_by_id(@decoded_auth_token['sub'])
  end
  
  def service
    @service ||= Customer::AuthService.new
  end

end

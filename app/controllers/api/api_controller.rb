class Api::ApiController < ActionController::API
  # include Swagger::Docs::Methods

  rescue_from StandardError, with: :handle_runtime_exception

  def handle_runtime_exception(exception)
    render(json: { message: exception.message, code: 400 }, status: 200)
  end

end

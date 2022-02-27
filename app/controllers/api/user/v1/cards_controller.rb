class Api::User::V1::CardsController < Api::User::V1::BaseController

  before_action :authenticate_request!

  def create
    begin
      req = ::User::CardRequest.new(card_params)
      req.user_id = @current_user.id
      if req.valid?(:create)
        card = service.add(req)
        render(json: card, serializer: CardSerializer)
      else
        errors(req.errors , message = "Failed to add card.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  private

  def card_params
    params.permit(:holder_name, :card_no, :expiry_month, :expiry_year, :is_default)
  end

  def service
    @service ||= CardService.new
  end

end

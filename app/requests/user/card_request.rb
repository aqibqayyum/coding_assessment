class User::CardRequest < User::UserCommonRequest

  attr_accessor :card_no, :holder_name, :expiry_year, :expiry_month, :user_id, :is_default

  validates :card_no, :holder_name, :expiry_year, :expiry_month, :user_id, presence: true, on: [:create, :update] 

  private

  def service
    @service ||= CardService.new
  end

end

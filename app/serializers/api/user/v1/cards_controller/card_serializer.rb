module Api::User::V1
  
  class CardSerializer < ::Api::User::V1::BaseSerializer
    attributes :holder_name, :expiry_year, :expiry_month, :token

    def message
      "Card has been added successfully."
    end
  end

end

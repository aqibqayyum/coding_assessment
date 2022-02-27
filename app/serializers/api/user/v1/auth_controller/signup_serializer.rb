module Api::User::V1
  
  class SignupSerializer < ::Api::User::V1::BaseSerializer
    attributes :success_code, :message, :first_name, :last_name, :email

    def message
      "Profile updated successfully."
    end
  end

end

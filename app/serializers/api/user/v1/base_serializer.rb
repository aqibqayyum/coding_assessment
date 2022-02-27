module Api::User::V1

  class BaseSerializer < ActiveModel::Serializer
    
    def success_code
      200
    end
  end

end  

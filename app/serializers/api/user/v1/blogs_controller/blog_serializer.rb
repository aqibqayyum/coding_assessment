module Api::User::V1
  
  class ::BlogSerializer < ::Api::User::V1::BaseSerializer
    attributes :id, :title, :content

    def message
      "Blog created successfully."
    end
  end

end

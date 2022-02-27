module Api::User::V1
  
  class ::BlogsSerializer < ::Api::User::V1::BaseSerializer
    attributes :id, :title, :content

    def message
      "All Blogs."
    end
  end

end

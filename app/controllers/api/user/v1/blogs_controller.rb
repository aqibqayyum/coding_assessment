class Api::User::V1::BlogsController < Api::User::V1::BaseController

  before_action :authenticate_request!

  def index
    begin
      req = ::User::BlogRequest.new(blog_params)
      blogs = service.search(req)
      render(json: blogs, each_serializer: BlogsSerializer)
    rescue Exception => e
      failur(e.message)
    end
  end

  def create
    begin
      req = ::User::BlogRequest.new(blog_params)
      req.user_id = @current_user.id
      if req.valid?(:create)
        blog = service.create(req)
        success("Blog has been created successfully.")
      else
        errors(req.errors , message = "Failed to create blog.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  def update
    begin
      req = ::User::BlogRequest.new(blog_params)
      req.user_id = @current_user.id
      if req.valid?(:update)
        service.update(req)
        success("Blog has been updated successfully.")
      else
        errors(req.errors , message = "Failed to update blog.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  def destroy
    begin
      req = ::User::BlogRequest.new(blog_params)
      req.user_id = @current_user.id
      if req.valid?(:destroy)
        service.destroy(req)
        success("Blog has been deleted successfully.")
      else
        errors(req.errors , message = "Failed to delete blog.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  def show
    begin
      req = ::User::BlogRequest.new(blog_params)
      req.user_id = @current_user.id
      if req.valid?(:show)
        blog = service.find(req.id)
        render(json: blog, serializer: BlogSerializer)
      else
        errors(req.errors , message = "Blog not found.")
      end
    rescue Exception => e
      failur(e.message)
    end
  end

  private

  def blog_params
    params.permit(:id, :title, :content)
  end

  def service
    @service ||= BlogService.new
  end

end

class BlogService < BaseService

  def find(id)
    Blog.find(id)
  end

  def find_by_id(id)
    Blog.find_by_id(id)
  end

  def find_by_title(title)
    Blog.find_by_title(title)
  end

  def create(req)
    Blog.create(
      title: req.title,
      content: req.content,
      user_id: req.user_id
    )
  end

  def update(req)
    blog = find(req.id)
    blog.update(
      title: req.title,
      content: req.content
    )
  end

  def destroy(req)
    blog = find(req.id)
    blog.destroy
  end

  def all
    Blog.all
  end

  def search(req)
  end
end

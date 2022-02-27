class User::BlogRequest < User::UserCommonRequest

  attr_accessor :id, :title, :content, :user_id

  validates :title, :content, :user_id, presence: true, on: [:create, :update] 
  validate :is_blog_availble_for_user, on: [:update, :destroy]
  validates :id, presence: true, on: [:show]
  validate :is_blog_present, on: [:show]

  private


  def is_blog_availble_for_user
    blog = service.find_by_id(self.id)
    if blog.blank? || blog.user_id != self.user_id
      errors.add(:error, 'Blog not available.')
    end
  end

  def is_blog_present
    blog = service.find_by_id(self.id)
    if blog.blank?
      errors.add(:error, 'Blog not found.')
    end
  end

  def service
    @service ||= BlogService.new
  end

end

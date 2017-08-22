class PostPolicy <ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user == post.user
  end

  def destroy?
     return true if user.present? && user == post.user_id
  end
end

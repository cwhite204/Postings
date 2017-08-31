class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :member
        can :read, Post
        can :manage, Post, user_id: user.id
        can :upvote, Post
        can :downvote, Post
      else
        can :read, Post
      end
  end
end

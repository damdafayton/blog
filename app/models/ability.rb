class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :create, :all
    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    # can :read, Post, user: user
    return unless user.is?(:admin) # additional permissions for administrators

    can :manage, :all

    # Handle the case where we don't have a current_user i.e. the user is a guest

    # Define a few sample abilities
    #  cannot    :manage , Post
    #  cannot :manage , Comment
    #  can    :read   , Tag , released: true

    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
    #   if user.is? :admin
    #     can :manage, :all
    #   else
    #     can :read, :all
    #     can :manage, Post, user_id: user.id # if the user is logged in can manage it's own posts
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

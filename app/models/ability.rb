class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
      cannot :reject, Article, :status => "pending"
      cannot :approve, Article, :status => "public"
      cannot [:edit, :update], Article, :status => "deleted"
    elsif user.role == 'editor'
      can [:read, :update], Article
      can [:edit, :update], Article, :status => "pending"
      cannot [:edit, :update], Article do |article|
        !(user.categories.include? article.category)
      end
      can [:create, :new], Article do |article|
        (user.categories.include? article.category) or (article.category_id == nil)
      end

      can :read, Category do |category|
        user.categories.include? category
      end 
    end
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

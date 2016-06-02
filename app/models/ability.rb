class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)

    can :manage, :subscriptions if user.has_role? :app_admin

    #app_admin can perform all operations
    can :manage, WeatherGrid if user.has_role? :app_admin
    can :manage, WeatherLocation if user.has_role? :app_admin


    #app_user can only read
    can :read, WeatherGrid if user.has_role? :app_user
    can :read, WeatherLocation if user.has_role? :app_user

    #Adding ability to create weather grid
    can :create, WeatherGrid if user.has_role? :app_user

    #Only owners can edit weather grid
    can :update, WeatherGrid do |weather_grid|
        weather_grid.try(:user) == user
    end

    can :delete, WeatherGrid do |weather_grid|
        weather_grid.try(:user) == user
    end



    #Weather Locations
    




  end
end
class Ability
  include CanCan::Ability

  def initialize(user)

    # handle case where user is not yet logged in
    user ||= User.new # guest user
    
    if user.is_teacher?
        can :manage, [Behavior, BehaviorInstance, Chart, DayRecord, Metric, Note, PhaseLine, Slice]
        can [:read, :update], User do |u|
            user.id == u.id
        end
    elsif user.is_admin?
        can :manage, :all
    end
  end
end

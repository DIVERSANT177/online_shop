# frozen_string_literal: true

class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user
    user_rules
    admin_rules if user&.admin?
  end

  def user_rules
    can :read, Order, user: user
    can :create, Order
    cannot :manage, Admin
  end

  def admin_rules
    can :manage, Admin
    can :manage, Cart
    can :manage, Product
  end
end

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    false
  end

  def show?
    true
  end

  def edit?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end

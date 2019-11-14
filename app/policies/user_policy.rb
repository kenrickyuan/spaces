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
    record == user # can say true here also, as the person accessing the url will always get their own user#edit page
  end

  def update?
    record == user # can say true here also, as the person accessing the url will always get their own user#edit page
  end

  def destroy?
    false
  end
end

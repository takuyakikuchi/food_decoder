class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new
    create?
  end

  def create?
    return true
  end

  def update?
    return true
  end

  def bookmark?
    return true
  end
end

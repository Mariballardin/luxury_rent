class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end
  def create?
    true
  end

  def new?
    true
  end

  def update?
    record.user == user
  end
end

    # def destroy?
    #   record.user == user
    # end

    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
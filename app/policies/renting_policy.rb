class RentingPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.where(user: user)
    end
  end

  def edit?
    true
  end

  def update?
    true
  end
end

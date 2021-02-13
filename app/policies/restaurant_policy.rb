class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
    # everyone can do it
  end

  def update?
    # you can update if you own the restaurant
    record.user == user
  end

  def create?
    # you must logged in
    !user.nil?
  end

  def destroy?
    # you can destroy it if you match the update? criteria
    update?
  end
end

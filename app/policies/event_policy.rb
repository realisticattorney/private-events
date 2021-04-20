class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.host_id == @user.id
  end

  def update?
    @record.host_id == @user.id
  end

  def new?; end

  def create?; end

  def destroy?
    @record.host_id == @user.id
  end
end

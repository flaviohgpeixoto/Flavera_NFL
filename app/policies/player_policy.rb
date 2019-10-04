class PlayerPolicy < ApplicationPolicy
  def update?
    @user.id != 1
  end
end

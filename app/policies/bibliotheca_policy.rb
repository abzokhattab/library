class BibliothecaPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all unless user.nil?
    end
  end

  def show?
    user.is_librarian?
  end

  def index?
    user.is_librarian?
  end

  def new?
    user.is_librarian?
  end

  def update?
    user.is_librarian?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def create?
    update?
  end

end

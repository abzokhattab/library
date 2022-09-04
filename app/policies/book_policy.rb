class BookPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      #	scope.all unless user.nil?
      if user.is_librarian?
        scope.where(bibliotheca_id: user.try(:bibliotheca_id))
      elsif $complete
        scope.where(bibliotheca_id: user.try(:bibliotheca_id), status: :available).or(scope.where(user_id: user.try(:id), bibliotheca_id: user.try(:bibliotheca_id)))
      else
        scope.where(user_id: user.try(:id), bibliotheca_id: user.try(:bibliotheca_id))
      end
    end
  end

  def show?
    not user.nil?
  end

  def index?
    show?
  end

  def mybooks?
    not user.is_librarian?
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

  def rent?
    not user.is_librarian?
  end

  def return?
    not user.is_librarian?
  end

end

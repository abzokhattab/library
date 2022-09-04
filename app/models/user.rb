class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :bibliotheca, foreign_key: :bibliotheca_id
  has_many :books
  enum role: { user: 0, librarian: 1 }

  def is_librarian?
    librarian?
  end
end

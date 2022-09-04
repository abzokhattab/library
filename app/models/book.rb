class Book < ApplicationRecord
  belongs_to :bibliotheca
  belongs_to :user, required: false
  enum status: { available: 0, rented: 1 }
  validates :isbn, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates_uniqueness_of :isbn, confirmation: { case_sensitive: false }
  before_create :set_default_status

  def initialize(attributes = {})
    super
    set_default_status
  end

  def set_default_status
    self.status ||= :available
  end
end

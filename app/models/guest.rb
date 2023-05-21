class Guest < ApplicationRecord
  belongs_to :invite
  validates :name, presence: true

  enum status: [:unanswered, :confirmed, :does_not_come]

  before_save :set_status, if: -> { status.blank? }

  def set_status
    self.status = :unanswered
  end
end

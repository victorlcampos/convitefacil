class Guest < ApplicationRecord
  belongs_to :invite
  validates :name, presence: true

  enum status: [:unanswered, :confirmed, :does_not_come]
end

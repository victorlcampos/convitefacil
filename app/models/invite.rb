class Invite < ApplicationRecord
  validates :family_name, presence: true

  belongs_to :party
  has_many :guests, dependent: :destroy
  accepts_nested_attributes_for :guests

  before_save :set_invite_uid, if: -> { invite_uid.blank? }

  def set_invite_uid
    self.invite_uid = "#{SecureRandom.hex(2)}-#{family_name.parameterize}"
  end

  def invite_param
    invite_uid
  end
end

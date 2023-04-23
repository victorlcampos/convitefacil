class Invite < ApplicationRecord
  validates :family_name, presence: true

  belongs_to :party
  has_many :guests

  before_save :set_invite_uid, if: -> { invite_uid.blank? }

  def set_invite_uid
    self.invite_uid = "#{SecureRandom.hex(10)}-#{family_name.parameterize}"
  end

  def invite_param
    invite_uid
  end
end

class Invite < ApplicationRecord
  belongs_to :party
  validates :family_name, presence: true

  before_save :set_invite_uid, if: -> { invite_uid.blank? }

  def set_invite_uid
    self.invite_uid = "#{SecureRandom.hex(10)}-#{family_name.parameterize}"
  end

  def invite_param
    invite_uid
  end
end

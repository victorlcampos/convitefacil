class Party < ApplicationRecord
  validates :name, presence: true

  before_save :set_admin_uid, if: -> { admin_uid.blank? }
  before_save :set_invite_uid, if: -> { invite_uid.blank? }

  has_many :invites

  has_one_attached :background

  def set_admin_uid
    self.admin_uid = SecureRandom.uuid
  end

  def set_invite_uid
    self.invite_uid = "#{SecureRandom.hex(10)}-#{name.parameterize}"
  end

  def admin_param
    admin_uid
  end

  def invite_param
    invite_uid
  end
end

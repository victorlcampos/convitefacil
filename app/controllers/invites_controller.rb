class InvitesController < ApplicationController
  before_action :find_party
  before_action :find_invite

  def show
    @guests = @invite.guests
  end

  protected

  def find_party
    unless (@party = Party.find_by(invite_uid: params[:party_id]))
      raise ActiveRecord::RecordNotFound
    end
  end

  def find_invite
    unless (@invite = @party.invites.find_by(invite_uid: params[:id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

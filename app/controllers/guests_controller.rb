class GuestsController < ApplicationController
  before_action :find_party
  before_action :find_invite
  before_action :find_guest

  def edit
    @guests = @invite.guests
  end

  def update
    @guest.attributes = params.require(:guest).permit(:status)
    @guest.save!
    redirect_to edit_party_invite_guest_path(@party.invite_param, @invite.invite_param, @guest)
  end

  protected

  def find_party
    unless (@party = Party.find_by(invite_uid: params[:party_id]))
      raise ActiveRecord::RecordNotFound
    end
  end

  def find_invite
    unless (@invite = @party.invites.find_by(invite_uid: params[:invite_id]))
      raise ActiveRecord::RecordNotFound
    end
  end

  def find_guest
    unless (@guest = @invite.guests.find_by(id: params[:id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

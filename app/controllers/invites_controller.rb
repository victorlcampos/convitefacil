class InvitesController < ApplicationController
  before_action :find_party
  before_action :find_invite

  def show
    @guests = @invite.guests
  end

  def update
    @invite.attributes = params.require(:invite).permit(guests_attributes: [:status, :id])
    @invite.save!
    redirect_to party_invite_url(@party.invite_param, @invite.invite_param), flash: { success: "Respostas enviadas com sucesso" }
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

class Admin::InvitesController < ApplicationController
  before_action :find_party
  before_action :find_invite, only: [:edit, :update]

  def index
    @invites = @party.invites
  end

  def new
    @invite = @party.invites.build
  end

  def create
    @invite = @party.invites.build
    @invite.attributes = params.require(:invite).permit(:family_name)

    if @invite.save
      redirect_to edit_admin_party_invite_path(@party.admin_param, @invite.invite_param)
    else
      render :new
    end
  end

  def edit; end

  def update
    @invite.attributes = params.require(:invite).permit(:family_name)

    if @invite.save
      redirect_to edit_admin_party_invite_path(@party.admin_param, @invite.invite_param)
    else
      render :edit
    end
  end

  protected

  def find_party
    unless (@party = Party.find_by(admin_uid: params[:party_id]))
      raise ActiveRecord::RecordNotFound
    end
  end

  def find_invite
    unless (@invite = @party.invites.find_by(invite_uid: params[:id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

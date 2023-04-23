class Admin::InvitesController < ApplicationController
  before_action :find_party

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
      redirect_to admin_party_invites_path(@party.admin_param)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  protected

  def find_party
    unless (@party = Party.find_by(admin_uid: params[:party_id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

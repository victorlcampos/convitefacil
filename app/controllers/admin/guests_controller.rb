class Admin::GuestsController < ApplicationController
  before_action :find_party
  before_action :find_invite
  before_action :find_guest, only: [:edit, :update]

  def index
    @guests = @invite.guests
  end

  def new
    @guest = @invite.guests.build
  end

  def create
    @guest = @invite.guests.build(params.require(:guest).permit(:name, :status))

    if @guest.save
      redirect_to admin_party_invite_guests_path(@party.admin_param, @invite.invite_param)
    else
      render :new
    end
  end

  def edit; end

  def update
    @guest.attributes = params.require(:guest).permit(:name, :status)

    if @guest.save
      redirect_to admin_party_invite_guests_path(@party.admin_param, @invite.invite_param)
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

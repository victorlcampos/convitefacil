class Admin::InvitesController < ApplicationController
  before_action :find_party
  before_action :find_invite, only: [:edit, :update, :destroy]

  def index
    @invites = @party.invites

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="Convidados.xlsx"'
      }
    end
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @invite.attributes = params.require(:invite).permit(:family_name)

    if @invite.save
      redirect_to admin_party_invites_path(@party.admin_param)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @invite.destroy!
    redirect_to admin_party_invites_path(@party.admin_param)
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

class Admin::Party::BackgroundsController < ApplicationController
  before_action :find_party

  def destroy
    @party.background.purge
    redirect_to edit_admin_party_path(@party.admin_param)
  end

  protected

  def find_party
    unless (@party = Party.find_by(admin_uid: params[:party_id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

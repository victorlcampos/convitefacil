class Admin::PartiesController < ApplicationController
  before_action :find_party

  def edit
  end

  def update
    @party.attributes = params.require(:party).permit(:name, :address, :description)

    if @party.save
      redirect_to edit_admin_party_path(@party.admin_param)
    else
      render :edit
    end
  end

  protected

  def find_party
    unless (@party = Party.find_by(admin_uid: params[:id]))
      raise ActiveRecord::RecordNotFound
    end
  end
end

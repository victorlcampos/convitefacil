class PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params.require(:party).permit(:name, :address, :description))

    if @party.save
      redirect_to edit_admin_party_path(@party.admin_param)
    else
      render :new
    end
  end
end

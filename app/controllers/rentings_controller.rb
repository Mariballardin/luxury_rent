class RentingsController < ApplicationController
  def index
  end

  def destroy
    @renting = Renting.find(params[:id])
    @renting.destroy
    redirect_to rentings_path, notice: 'Renting was successfully deleted.'
  end
end

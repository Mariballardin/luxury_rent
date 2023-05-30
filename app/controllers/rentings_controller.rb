class RentingsController < ApplicationController
<<<<<<< HEAD
  def index
=======
  def new
    @product = Product.find(params[:product_id])
    @reservation = Renting.new
  end

  def create
    @product = Product.find(params[:product_id])
    @renting = @product.reservations.new(reservation_params)
    if @renting.save
      redirect_to @product, notice: 'Reservation was successfully created.'
    else
      render :new
    end
>>>>>>> 51e4688c412ba20167bf356056e96f48873ab144
  end

  def destroy
    @renting = Renting.find(params[:id])
    @renting.destroy
<<<<<<< HEAD
    redirect_to rentings_path, notice: 'Renting was successfully deleted.'
=======
    redirect_to rentings_path, notice: 'Reservation was successfully deleted.'
  end

  def edit
    @product = Product.find(params[:product_id])
    @renting = Renting.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @renting = Renting.find(params[:id])
    if @renting.update(renting_params)
      redirect_to @product, notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  private

  def renting_params
    params.require(:renting).permit() # Adjust the permitted attributes as needed
>>>>>>> 51e4688c412ba20167bf356056e96f48873ab144
  end
end

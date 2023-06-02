class RentingsController < ApplicationController
  # include Pundit::Authorization
  before_action :set_product, except: [:index, :edit]

  def index
    @rentings = policy_scope(Renting)
    @products = current_user.products
  end

  def show
    @renting = Renting.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @renting = Renting.new
    authorize @product
    @renting.product = @product
    @renting.user = current_user
    @renting.status = false
    if @renting.save
      redirect_to @product, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @renting = Renting.find(params[:id])
    @renting.destroy
    redirect_to rentings_path, notice: 'Reservation was successfully deleted.'
  end

  # def edit
  #   @renting = Renting.find(params[:id])
  #   authorize @renting
  #   @renting.status = true
  #   @renting.save
  # end

  def update
    @renting = Renting.find(params[:id])
    authorize @renting
    @renting.status = true
    @renting.save
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
    authorize @product
  end

  def renting_params
    params.require(:renting).permit(:status) # Adjust the permitted attributes as needed
  end
end

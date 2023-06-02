class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # include Pundit::Authorization
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @rentings = Renting.all
    @products = policy_scope(Product)
  end

  def show
    @products = policy_scope(Product)
    @renting = Renting.new
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @user = current_user
    authorize @product
    @product.user = @user
    authorize @product
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:description, :price, :condition, :photo, :category)
  end
end

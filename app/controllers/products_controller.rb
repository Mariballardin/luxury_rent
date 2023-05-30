class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  # include Pundit::Authorization
  before_action :set_products, only: [:show]

  def index
    @products = Product.all
    @products = policy_scope(Product)
  end

  def show
    authorize @product
  end

  def new
    @product = Product.new

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

    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    authorize @product
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end



  def product_params
    params.require(:product).permit(:description, :price, :condition, :photo, :category)
  end
end

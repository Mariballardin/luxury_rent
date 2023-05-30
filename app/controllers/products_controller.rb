class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end
end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  @user = current_user
  authorize user
  if @product.save
    redirect_to @product, notice: 'Product was successfully created.'
  else
    render :new
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path, notice: 'Product was successfully deleted.'
end

def product_params
  params.require(:product).permit(:description, :price, :condition, :image, :category)
end

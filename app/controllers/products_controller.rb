class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end
end

def new
end

def product_params
  params.require(:product).permit(:description, :price, :condition, :image, :category)
end

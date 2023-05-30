class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end
end

def product_params
  params.require(:product).permit(:description, :price, :condition, :image, :category)
end

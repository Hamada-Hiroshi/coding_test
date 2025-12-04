class ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products.as_json, status: :ok
  end
end

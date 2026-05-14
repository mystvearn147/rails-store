class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show ]

  def index
    @products = Product.all
  end

  def show
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end

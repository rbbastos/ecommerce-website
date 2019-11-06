# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @pagy, @products = pagy(Product.order(:name), items: 10)
  end

  def show
    @product = Product.find(params[:id])
  end

  # GET /products/search_results
  # convention that search result should be shareable like a link. IF you submit with a POST you cant bookmark that, IF you submit GET you can bookmark that
  def search_results
    @query = params[:query]
    @products = Product.where('name LIKE ?', "%#{@query}%")
  end
end

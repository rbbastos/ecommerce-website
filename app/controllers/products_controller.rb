# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  # GET /products/search_results
  # convention that search result should be shareable like a link. IF you submit with a POST you cant bookmark that, IF you submit GET you can bookmark that
  def search_results
    @query = params[:query].to_s
    puts @query
    @id = params[:category].to_s
    if params[:category].to_s == ''
      @products = Product.where('name LIKE ?', "%#{@query}%")
    else
      @products = Product.where('products.name LIKE ?', "%#{@query}%").joins(:category).where('categories.id == ?', @id.to_s)
    end
    # <%= select_tag :category, options_for_select(['All', 'Computers & Tablets', 'Musical Instruments', 'Smart Home & Car Electronics', 'TV & Home Theatre', 'Video Games & Movies']) %>
  end
end

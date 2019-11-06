# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @pagy, @categories = pagy(Category.order(:name))
  end

  def show
    @category = Category.find(params[:id])
  end
end

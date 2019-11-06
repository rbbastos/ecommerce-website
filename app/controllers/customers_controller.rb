# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @pagy, @customers = pagy(Customer.order(:name))
  end

  def show
    @customer = Customer.find(params[:id])
  end
end

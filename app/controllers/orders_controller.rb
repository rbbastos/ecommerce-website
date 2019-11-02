# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.order(:name)
  end

  def show
    @order = Order.find(params[:id])
  end
end

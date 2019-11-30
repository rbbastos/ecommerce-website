# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.order(:name)
  end

  def show
    @order = Order.find(params[:id])
  end

  def review_order
    if session[:order_id].nil?
      redirect_to root_path
    else
      @order = current_order
      # Need some adjustment to include address
      assign_atr(@order).save
    end
  end

  def order_final
    if session[:order_id].nil?
      redirect_to root_path
    else
      @order = current_order
      @order.created_at = Time.now
      @order.save
      session[:order_id] = nil
    end
  end

  private

  def assign_atr(order)
    @cust_id = session[:cust_id]
    @cust = Customer.find(@cust_id)
    order.assign_attributes(
      customer_id: @cust_id,
      pstTimeOfPurchase: @cust.province.pstTax,
      gstTimeOfPurchase: @cust.province.gstTax
    )
    order
  end
end

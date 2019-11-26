# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_one :payment
  has_many :line_items
  has_many :products, through: :line_items, source: :product
  accepts_nested_attributes_for :line_items, allow_destroy: true
  # validates :pstTimeOfPurchase, :gstTimeOfPurchase, presence: true
  # validates :pstTimeOfPurchase, :gstTimeOfPurchase, numericality: { only_decimal: true }

  before_save :set_subtotal

  def subtotal
    line_items.collect { |line_item| line_item.valid? ? (line_item.unit_price.to_f * line_item.quantity.to_i) : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end

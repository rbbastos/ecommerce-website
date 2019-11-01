# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, :priceTimeOfPurchase, presence: true
  validates :quantity, :priceTimeOfPurchase, numericality: { only_decimal: true }
end

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_one :payment
  has_many :line_items
  has_many :products, through: :line_items, source: :product
  validates :pstTimeOfPurchase, :gstTimeOfPurchase, presence: true
  validates :pstTimeOfPurchase, :gstTimeOfPurchase, numericality: { only_decimal: true }
end

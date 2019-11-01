# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_one :payment
  has_many :lineItems
  has_many :products, through: :lineItems
  validates :pstTimeOfPurchase, :gstTimeOfPurchase, presence: true
  validates :pstTimeOfPurchase, :gstTimeOfPurchase, numericality: { only_decimal: true }
end

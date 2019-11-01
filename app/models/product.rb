# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :lineItems
  has_many :orders, through: :lineItems
  validates :name, :manufacturer, :sellPrice, presence: true
  validates :sellPrice, numericality: { only_decimal: true }
end

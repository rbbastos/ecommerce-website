# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  belongs_to :deal
  has_many :lineItems
  has_many :orders, through: :lineItems, source: :order
  validates :name, :manufacturer, :sellPrice, presence: true
  validates :sellPrice, numericality: { only_decimal: true }
  paginates_per 15
end

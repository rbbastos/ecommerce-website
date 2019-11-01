# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  validates :name, :manufacturer, :sellPrice, presence: true
  validates :sellPrice, numericality: { only_decimal: true }
end

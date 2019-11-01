# frozen_string_literal: true

class Province < ApplicationRecord
  validates :name, :gstTax, :pstTax, presence: true
  validates :gstTax, :pstTax, numericality: { only_decimal: true }
end

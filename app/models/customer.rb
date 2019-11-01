# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :province
  validates :firstName, :lastName, presence: true
end

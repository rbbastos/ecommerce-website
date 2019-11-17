# frozen_string_literal: true

class AddDealToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :deal, null: false, foreign_key: true
  end
end

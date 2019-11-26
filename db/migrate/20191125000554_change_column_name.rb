# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :line_items, :price_time_of_purchase, :unit_price
  end
end

# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :deal_id, :string, null: false
  end
end

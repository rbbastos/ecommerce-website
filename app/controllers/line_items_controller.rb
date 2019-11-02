# frozen_string_literal: true

class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.order(:name)
  end
end

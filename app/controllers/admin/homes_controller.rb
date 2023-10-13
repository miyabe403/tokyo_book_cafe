# frozen_string_literal: true

class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end
end

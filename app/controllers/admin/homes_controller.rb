# frozen_string_literal: true

class Admin::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
  end
end

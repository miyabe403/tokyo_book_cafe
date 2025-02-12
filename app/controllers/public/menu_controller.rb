# app/controllers/menu_controller.rb

class MenuController < ApplicationController
  def index
    # APIからメニュー情報を取得
    api = StarbucksAPI.new
    # @menu_items = api.get_menu_items['categoryList']
    @menu_items = api.get_menu_items

    if @menu_items.nil? || @menu_items.empty?
      @error_message = "No menu items available at the moment."
    end
  end
end

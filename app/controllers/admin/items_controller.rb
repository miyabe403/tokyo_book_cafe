class Admin::ItemsController < ApplicationController

  require 'json'
  require 'open-uri'

  def index 

    @search = "False"
    @items = Item.page(params[:page]).per(10)

    url = "https://product.starbucks.co.jp/api/category-product-list/beverage/index.json"
    base_url = url.split("/api/").first
    attribute_keys = [:product_code, :name, :explanation, :image1]

    result = JSON.parse(URI.open(url).read, symbolize_names: true)
    items_hash = result.map{|o| Hash[* attribute_keys.map{|attr| [ attr, (attr == :image1 ? base_url + o[attr] : o[attr] ) ] }.flatten ] }
    @items = []
    items_hash.each do |attribute|
      items = Item.find_by(product_id: attribute[:product_code])
      unless item
        items.create!(attribute)
      end
      @items << item
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
    
    @search = "False"
    @items = Item.page(params[:page]).per(10)

    url = "https://product.starbucks.co.jp/api/category-product-list/beverage/index.json"
    base_url = url.split("/api/").first
    attribute_keys = [:product_code, :product_name, :product_note, :image1]

    result = JSON.parse(URI.open(url).read, symbolize_names: true)
    drinks_hash = result.map{|o| Hash[* attribute_keys.map{|attr| [ attr, (attr == :image1 ? base_url + o[attr] : o[attr] ) ] }.flatten ] }
    @drinks = []
    drinks_hash.each do |attribute|
      drink = Drink.find_by(product_id: attribute[:product_code])
      unless drink
        drink.create!(attribute)
      end
      @drinks << drink
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :genre_id, :is_sell)
  end
end
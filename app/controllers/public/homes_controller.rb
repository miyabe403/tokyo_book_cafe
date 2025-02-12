class Public::HomesController < ApplicationController
  require 'json'
  
  def top 
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
    
    @reading_records = ReadingRecord.all
  end
  
  def about
  end
  
  def starbucks
    @product_data = fetch_product_data_from_api

    # デバッグ用にログに出力
    # Rails.logger.debug "Product Data: #{@product_data.inspect}"
  end
  
  def create_record_form
    # フォーム表示に必要な処理を追加
  end
  
  def create_record
    # フォームから送信されたデータを受け取る
    title = params[:title]
    author = params[:author]
    pages_read = params[:pages_read]
    reading_time = params[:reading_time]
    read_at = params[:read_at]
    cover_image = params[:cover_image]

    # 新しい読書記録を作成
    new_record = {
      title: title,
      author: author,
      pages_read: pages_read,
      reading_time: reading_time,
      read_at: read_at,
      cover_image: cover_image
    }

    # JSONファイルに記録を追加
    file_path = Rails.root.join('tmp', 'reading_records.json')
    existing_data = File.exists?(file_path) ? JSON.parse(File.read(file_path)) : []
    existing_data << new_record

    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(existing_data))
    end

    redirect_to root_path
  end
  
  # def create_record
  #   # ここで新しい読書記録を作成
  #   ReadingRecord.create(title: "Example Book", author: "John Doe", pages_read: 200, reading_time: 5, read_at: Time.now, cover_image: "image_url")
    
  #   redirect_to root_path
  # end

  private

  def fetch_product_data_from_api
    # APIまたはファイルからデータを取得
    response = Net::HTTP.get(URI("https://product.starbucks.co.jp/api/category-product-list/beverage/index.json"))
    data = JSON.parse(response)

    # レスポンスデータを返す
    return data
  end
  
  # def starbucks
  #   begin
  #     file = File.read(Rails.root.join('tmp', 'starbucks_menu.json'))
  #     @product_data = JSON.parse(file)
  #     Rails.logger.debug("Loaded product data: #{@product_data.inspect}")
  #   rescue => e
  #     Rails.logger.error("Error reading JSON file: #{e.message}")
  #     @product_data = nil
  #   end

  #   if @product_data.nil?
  #     Rails.logger.error("Product data is nil!")
  #   else
  #     Rails.logger.debug("Product data is present!")
  #   end
  # end
  
  # def index
  #   begin
  #     file = File.read(Rails.root.join('tmo', 'starbucks_menu.json'))
  #     @product_data = JSON.parse(file)
  #     Rails.logger.debug("Product data: #{@product_data}")
  #   rescue => e
  #     Rails.logger.error("Error reading JSON file: #{e.message}")
  #     @product_data = nil
  #   end

  #   @chunk_products = @product_data ? @product_data['chunk_products'] : []
  # end
  
  # def index
  #   # JSONデータを読み込む
  #   file = File.read(Rails.root.join('tmp', 'starbucks_menu.json'))
  #   @product_data = JSON.parse(file)
    
  #   # デバッグ用に @product_data を表示
  #   Rails.logger.debug("Product data: #{@product_data}")

  #   # chunk_productsも個別に取得
  #   @chunk_products = @product_data['chunk_products']
  # end
  
  # def index
  #   # APIからメニュー情報を取得
  #   api = StarbucksAPI.new
  #   # @menu_items = api.get_menu_items['categoryList']
  #   @menu_items = api.get_menu_items
    
  #   # デバッグ用ログ
  #   # コントローラーでのログ出力
  #   logger.debug "Menu items: #{@menu_items}"


  #   if @menu_items.nil? || @menu_items.empty?
  #     @error_message = "No menu items available at the moment."
  #   end
  # end
end

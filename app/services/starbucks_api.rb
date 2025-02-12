# app/services/starbucks_api.rb

class StarbucksAPI
  include HTTParty
  base_uri 'https://product.starbucks.co.jp/api/category-product-list/beverage'

  def get_menu_items
    response = self.class.get('/index.json')

    
    # レスポンスをデバッグ
    if response.success?
      puts "API Response: #{response.body}"
    else
      puts "API request failed with status: #{response.code}"
    end

    # レスポンスをJSONにパース
    parsed_response = JSON.parse(response.body)
    puts "Parsed Response: #{parsed_response}"

    # chunk_products を取り出す
    parsed_response['chunk_products'] || []
    # parsed_response
  end
    # レスポンスをデバッグ
  #   puts response.body # レスポンスをコンソールに出力

  #   parsed_response = JSON.parse(response.body)
  #   puts parsed_response # レスポンスをパース後も確認

  #   parsed_response
  # end

  # メニュー情報を取得するメソッド
  # def get_menu_items
  #   response = self.class.get('/index.json')
  #   JSON.parse(response.body)
  # end
end

require 'json'

class ReadingRecord
  FILE_PATH = Rails.root.join('tmp', 'reading_records.json')

  attr_accessor :title, :author, :pages_read, :reading_time, :read_at, :cover_image

  # データの読み込み
  def self.all
    data = read_data
    data.map { |record| new(record) }
  end

  # 新しいレコードを保存
  def self.create(attrs)
    data = read_data
    data << attrs
    write_data(data)
  end

  # 個別のレコード
  def initialize(attrs = {})
    @title = attrs[:title]
    @author = attrs[:author]
    @pages_read = attrs[:pages_read]
    @reading_time = attrs[:reading_time]
    @read_at = attrs[:read_at]
    @cover_image = attrs[:cover_image]
  end

  # ファイルからデータを読み込む
  def self.read_data
    # tmpディレクトリ内のファイルが存在しない場合、新しく空のファイルを作成
    unless File.exist?(FILE_PATH)
      write_data([])  # 空の配列を書き込む
    end

    JSON.parse(File.read(FILE_PATH), symbolize_names: true)
  rescue JSON::ParserError => e
    # 解析エラーが発生した場合も空の配列を返す
    []
  end

  # ファイルにデータを書き込む
  def self.write_data(data)
    File.write(FILE_PATH, JSON.pretty_generate(data))
  end
end
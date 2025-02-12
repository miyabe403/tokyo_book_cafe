class ReadingRecordsController < ApplicationController
  def new
    @reading_record = ReadingRecord.new
  end

  def create
    @reading_record = ReadingRecord.new(reading_record_params)

    # 本の情報をGoogle Books APIから取得
    book_info = BookService.search_books(@reading_record.title)
    if book_info
      @reading_record.author = book_info[:authors].join(", ")
      @reading_record.cover_image = book_info[:cover_image]
      @reading_record.pages_read = book_info[:page_count]
    end

    if @reading_record.save
      redirect_to reading_records_path
    else
      render :new
    end
  end
  
  def index
    # 一週間ごとの集計
    @weekly_stats = ReadingRecord.group_by_week(:read_at).sum(:reading_time)
    @weekly_pages = ReadingRecord.group_by_week(:read_at).sum(:pages_read)
  end

  private

  def reading_record_params
    params.require(:reading_record).permit(:title, :reading_time, :read_at)
  end
end

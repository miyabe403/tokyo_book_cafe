class BookService
  BASE_URL = 'https://www.googleapis.com/books/v1/volumes'

  def self.search_books(query)
    response = HTTParty.get("#{BASE_URL}?q=#{query}&maxResults=1")
    return nil if response.code != 200

    book = response.parsed_response['items'].first
    {
      title: book['volumeInfo']['title'],
      authors: book['volumeInfo']['authors'],
      cover_image: book['volumeInfo']['imageLinks']&.dig('thumbnail'),
      page_count: book['volumeInfo']['pageCount']
    }
  end
end

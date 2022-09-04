json.extract! book, :id
json.merge! book.attributes.except("_id")
json.link books_url(book, format: :json)
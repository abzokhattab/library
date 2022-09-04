raise "You are trying to seed the db not in development mode!" unless Rails.env.development? or Rails.env.test?
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

library = Bibliotheca.create(name: "Test Library")

librarian = User.create(email: "librarian@test.com", role: :librarian, password: "password", password_confirmation: "password", bibliotheca_id: library.id)
user = User.create(email: "user@test.com", role: :user, password: "password", password_confirmation: "password", bibliotheca_id: library.id)

Book.create(title: "test book", author: "Tester", publication_year: 1999, isbn: "test123", status: :available, bibliotheca_id: library.id, user_id: librarian.id)

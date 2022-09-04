class BooksController < ApplicationController
  include BooksHelper
  before_action :authenticate_user!
  before_action :load_book, except: [:index, :mybooks, :create, :new]
  before_action :load_mybooks, only: [:mybooks]
  before_action :load_books, only: [:index]

  # GET /books or /books.json
  def index
  end

  def mybooks
    render "index"
  end

  # GET /books/1 or /books/1.json
  def show

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
    format.json { render :show, status: :created, location: @book }
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save!
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def rent
    respond_to do |format|
      if @book.present?
        unless @book.available?
          format.html { redirect_to book_url(@book), notice: "Book is not available to be rented." }
          format.json { render :show, status: :ok, location: @book }
        else
          @book.status = :rented
          @book.user_id = current_user.id
          @book.save
          format.html { redirect_to book_url(@book), notice: "Book was rented successfully." }
          format.json { render :show, status: :ok, location: @book }
        end
      end
    end
  end

  def return
    respond_to do |format|
      #byebug
      if @book.rented?
        @book.status = :available
        @book.user_id = nil
        @book.save
        format.html { redirect_to book_url(@book), notice: "Book was returned successfully." }
      else
        format.json { render :show, status: :ok, location: @book }
        format.html { redirect_to book_url(@book), notice: "Cannot return book." }
        format.json { render :show, status: :ok, location: @book }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :publication_year, :isbn, :bibliotheca_id, :status)
  end

end

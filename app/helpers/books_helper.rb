module BooksHelper

  def load_books
    $complete = true
    @books = policy_scope(Book)
    authorize @books

  end

  def load_mybooks
    $complete = false
    @books = policy_scope(Book)
    authorize @books
  end

  def load_book
    load_books
    id = permitted_params[:id]
    @book = @books.find(id)
  end

  def authorize_resource
    authorize Book
  end

  def permitted_params
    params.permit!
  end

  def post_params(extra_params = [])
    temp = extra_params + []
    return temp
  end

  def update_params
    pars = post_params
    pars.delete(:view_id)
    pars
  end

end


class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/top'
  end
  
  def edit
  end

   def show
    @book = Book.find(params[:id])
  end
end
  private
  def books_params
    params.require(:book).permit(:title, :body)
  end

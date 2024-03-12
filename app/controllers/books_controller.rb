class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new 
   @user = current_user
    
  end

  def create
      @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Welcome! You have signed up successfully."
   redirect_to user_path(@book.user.id)
 else
      flash[:notice] = "投稿に失敗しました。"
    render :show
  end
end
  
  def edit
     @book = Book.find(params[:id])
  end
  
  def update
     @book = Book.find(params[:id])
     @book.update(book_params)
     redirect_to user_path(@book.user.id)
  end

  def show
    @book = Book.find(params[:id])
    @book_create = Book.new
    @user = @book.user
  end
  
  def destroy
  books = Book.find(params[:id])
  books.destroy
  redirect_to '/books'
end
  
end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

class UsersController < ApplicationController

  def index
    @book = Book.new 
    @users = User.all
    @user = current_user
  end
  
   def create
      @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have created book successfully."
   redirect_to user_path(@user.id)
 else
      flash.now[:notice] = "投稿に失敗しました。"
    render :show
  end
end
  
  def edit
     @user = User.find(params[:id])
  end

   def show
     @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
      @user = current_user
  end
  
  def update
   @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(@user.id)
  end
  
end
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

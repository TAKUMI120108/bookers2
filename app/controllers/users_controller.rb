class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

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
       @user = current_user
       @book = Book.new 
    render :index
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
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      flash.now[:notice] = ""
    render :edit
    end
  end
  
end
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

 def is_matching_login_user
     @user = User.find(params[:id])
     unless @user.id == current_user.id
       redirect_to user_path(@user)
     end
 end
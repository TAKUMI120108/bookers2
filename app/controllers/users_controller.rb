class UsersController < ApplicationController

  def index
    @users = User.all
  end

 def create
      @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  
  def edit
  end

   def show
    @user = User.find(params[:id])
  end
end
  private

  def user_params
    params.require(:user).permit(:title, :body)
  end

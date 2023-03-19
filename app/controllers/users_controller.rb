class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @user2 = User.all
  end

  def show
    @book = Book.new
    @user = current_user
    @user2 = User.find(params[:id])
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
end

class UsersController < ApplicationController

before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @user = current_user
    @user2 = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(users_path) unless @user == current_user
  end
end

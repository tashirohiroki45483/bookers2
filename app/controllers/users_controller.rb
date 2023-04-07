# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

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
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path(current_user.id)) unless @user == current_user
    end

    def ensure_guest_user
      @user = User.find(params[:id])
      if @user.name == "guestuser"
        redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
      end
    end
end

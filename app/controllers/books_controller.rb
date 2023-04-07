# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @book2 = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @book2 = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to "/books"
  end

  def show
    @book = Book.new
    @book2 = Book.find(params[:id])
    @user = @book2.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to(books_path) unless @user == current_user
    end
end

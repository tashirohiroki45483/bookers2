class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @book2  = Book.all
    @user = current_user
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to '/books'
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
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

class BooksController < ApplicationController
  def index
    @book = Book.new 
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:userid])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
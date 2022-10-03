class BooksController < ApplicationController
  def index
    @book = Book.new 
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])  #削除するPostImageレコードを取得
    @book.destroy#削除
    redirect_to '/books'#の一覧ページへのパス
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end
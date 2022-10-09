class UsersController < ApplicationController
  def index
    @user = current_user 
    @users = User.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), flash: { notice: 'You have updated book successfully.' } 
    else
      render :edit
    end  
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:title, :body)
  end
end

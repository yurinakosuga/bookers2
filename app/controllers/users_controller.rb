class UsersController < ApplicationController
  def index
    @user = User.new 
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:title, :body)
  end
end

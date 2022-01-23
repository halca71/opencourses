class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:likes]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @pagy, @likes = pagy(@user.likes.order(id: :desc))
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end

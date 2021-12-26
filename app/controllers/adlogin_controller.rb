class AdloginController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if adlogin(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def adlogin(email, password)
    @admin = Admin.find_by(email: email)
    if @admin && @admin.authenticate(password)
      # ログイン成功
      session[:admin_id] = @admin.id
      return true
    else
      # ログイン失敗
      return false
    end
  end

end

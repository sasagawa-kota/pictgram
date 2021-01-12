class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if user && user.authenticate(paramas[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:denger] = 'ログインの失敗しました'
      render :new
    end
  end
   
  def destroy
    log_out
    redirect_to root_out, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


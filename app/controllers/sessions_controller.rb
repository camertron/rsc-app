class SessionsController < ApplicationController
  def new
  end

  def create
    login = params[:user][:login]
    password = params[:user][:password]
    user = User.find_by(login: login)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid login/password combination'
      render action: 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end
end

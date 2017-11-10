class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:name])
    # binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, {notice: 'Hello Again! Easy Reservations is ' \
        'elated that you returned!!!'}
    else
      redirect_to login_path, {alert: "Your Username or Password was invalid"}
      # render :new
    end
  end

end

class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, {notice: 'Hello Again! Easy Reservations is ' \
        'elated that you returned!!!'}
    else
      redirect_to login_path, {alert: "Your Username or Password was invalid"}
    end
  end

  def github
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    if current_user.addresses.present?
      redirect_to root_path, {notice: 'Hello Again! Easy Reservations is ' \
        'elated that you returned!!!'}
    else
      redirect_to new_address_path, {notice: 'Welcome! Please add your ' \
        'Home Address to continue'}
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end

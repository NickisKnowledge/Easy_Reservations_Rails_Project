class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.create(user_params)
    # debugger
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, {notice: 'Thanks for registering! Select ' \
        'the hotel you want to stay at.'}
    else
      render :new
    end
  end

  private
  def set_user
    @user = current_user
  end
  
  def user_params
  # binding.pry
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end

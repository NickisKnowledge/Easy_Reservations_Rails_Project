class UsersController < ApplicationController

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

  def user_params
  # binding.pry
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end
end

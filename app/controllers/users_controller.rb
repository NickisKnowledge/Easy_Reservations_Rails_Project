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
      redirect_to root_path
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

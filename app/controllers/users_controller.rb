class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @addresses = @user.addresses.build(address_type: 'Home')
  end

  def create
    raise params.inspect
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

  def show
    if current_user.id == params[:id].to_i
      render :show
    else
      flash[:alert] = "You don't have permission to access that profile"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    # raise params.inspect
    if @user.update(user_params)
      redirect_to user_path(@user), {notice: "#{@user.name}, your " \
        "profile has been updated"}
    else
      render :edit
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

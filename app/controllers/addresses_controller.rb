class AddressesController < ApplicationController
  before_action :require_login

  def new
    case
    when current_user.addresses.blank?
      @address = current_user.addresses.build(address_type: 'Home')
    when current_user.addresses.count == 1
      @address = current_user.addresses.build(address_type: 'Work')
    else
      redirect_to user_path(current_user), {alert: "If you need to update " \
        "an address, click the 'Edit Profile' button"}
    end
  end

  def create
    @address = Address.new(address_params)
    result = @address.work_address_issues?
    if @address.address_type == 'Work' && result[0]
      redirect_to user_path(current_user), {alert: "#{result[1]}" }
    else
      if @address.save
      redirect_to user_path(current_user),
        {notice: "Your #{@address.address_type} Address has been added"}
      else
      render :new
      end
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.delete
    redirect_to user_path(current_user),
      {notice: 'Work address has been removed'}
  end

  private
  def address_params
    params.require(:address).permit(
    :street_1,
    :street_2,
    :city,
    :state,
    :zipcode,
    :address_type,
    :user_id
    )
  end
end

class AddressesController < ApplicationController

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
    # raise params.inspect
    @address = Address.new(address_params)
    if @address.street_1.blank? && @address.city.blank? &&
      @address.state.blank? && @address.zipcode.blank?
      redirect_to user_path(current_user),
        {alert: 'Your Work Address was blank so it has not been added'}
    else
      @address.save
      redirect_to user_path(current_user),
        {notice: "Your #{@address.address_type} Address has been added"}
    end
  end

  def destroy
    # raise params.inspect
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

class AddressesController < ApplicationController

  def new
    @address = current_user.addresses.build(address_type: 'Work')
  end

  def destroy
    # raise params.inspect
    address = Address.find(params[:id])
    address.delete
    redirect_to user_path(current_user),
      {notice: 'Work address has been removed'}
  end
end

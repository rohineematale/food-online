class AddressesController < BaseController
  before_action :authenticate_user!
  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def new
    @addr = Address.new
  end

  def create
    @addr = current_user.addresses.build(address_params)
    if @addr.save
      respond_to do |format|
        format.html { redirect_to addresses_path }
        format.js
      end
    else
      respond_to do |format|
        flash[:danger] = @addr.errors.full_messages
        format.html { render :new }
        format.js
      end
    end
  end

  def edit; end

  def update
    if @addr.update_attributes(address_params) 
      respond_to do |format|
        format.html { redirect_to addresses_path }
        format.json
      end
    else
      respond_to do |format|
        flash[:danger] = @addr.errors.full_messages
        format.html { render :edit }
        format.json
      end
    end   
  end

  def destroy
    if @addr.destroy
      redirect_to addresses_path
    else
      redirect_to addresses_path
    end
  end

  private
    def set_record
      @addr = current_user.addresses.find_by_id params[:id]
      unless @addr
        flash[:danger] = "Sorry we could not found address"
        redirect_to addresses_path
      end
    end

    def address_params
      params.require(:address).permit(:name, :address1, :address2, :city, :state, :phone_number, :pincode, :is_primary)
    end
end
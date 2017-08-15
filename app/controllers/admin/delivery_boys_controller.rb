class Admin::DeliveryBoysController < Admin::BaseController

  before_action :set_record, only: [:edit, :update, :destroy]

  layout "admin"

  def index
    @delivery_boys = DeliveryBoy.all
  end

  def new
    @delivery_boy = DeliveryBoy.new
    @delivery_boy.build_photo
  end

  def create
    @delivery_boy = DeliveryBoy.new(delivery_boy_params)
    if @delivery_boy.save
      flash[:info] = "Delivery boy's record created successfully"
      redirect_to admin_delivery_boys_path
    else
      @delivery_boy.build_photo unless @delivery_boy.photo
      flash[:danger] = @delivery_boy.errors.full_messages
      render :new, danger: @delivery_boy.errors.full_messages
    end
  end

  def edit
    @delivery_boy.build_photo unless @delivery_boy.photo
  end

  def update
    if @delivery_boy.update_attributes(delivery_boy_params)
      flash[:info] = "Delivery boy's record updated successfully"
      redirect_to admin_delivery_boys_path
    else
      @delivery_boy.build_photo unless @delivery_boy.photo
      flash[:danger] = @delivery_boy.errors.full_messages
      render :new
    end
  end

  def destroy
    if @delivery_boy.destroy
      flash[:info] = "Delivery boy's record destroyed successfully"
      redirect_to admin_delivery_boys_path
    else
      flash[:danger] = @delivery_boy.errors.full_messages
      render :new
    end    
  end

  private
    def delivery_boy_params
      params.require(:delivery_boy).permit(:name, :phone_number, photo_attributes: [:image])
    end

    def set_record
      @delivery_boy = DeliveryBoy.find params[:id]
    end
end
class Admin::LocalitiesController < Admin::BaseController

  layout "admin"

  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @localities = Locality.all
  end

  def new
    @locality = Locality.new
  end

  def create
    @locality = Locality.new(locality_param)
    if @locality.save
      redirect_to admin_localities_path, notice: "Locality created successfully."
    else
      flash[:alert] = @locality.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @locality.update_attributes(locality_param)
      redirect_to admin_localities_path, notice: "Locality updated successfully."
    else
      flash[:alert] = @locality.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @locality.destroy
      redirect_to admin_localities_path, notice: "Locality destroyed successfully."
    else
      redirect_to admin_localities_path, alert: @locality.errors.full_messages
    end    
  end

  private
    def set_record
      @locality = Locality.find params[:id]
    end

    def locality_param
      params.require(:locality).permit(:pincode, :is_deliverable)
    end
end

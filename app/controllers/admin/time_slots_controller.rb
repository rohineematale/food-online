class Admin::TimeSlotsController < Admin::BaseController

  layout "admin"

  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @time_slots = TimeSlot.all
  end

  def new
    @time_slot = TimeSlot.new
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save
      flash[:info] = "Time slot created successfully"
      redirect_to admin_time_slots_path
    else
      flash[:danger] = @time_slot.errors.full_messages
      render :new, danger: @time_slot.errors.full_messages
    end
  end

  def edit; end

  def update
    if @time_slot.update_attributes(time_slot_params)
      flash[:info] = "Time slot updated successfully"
      redirect_to admin_time_slots_path
    else
      flash[:danger] = @time_slot.errors.full_messages
      render :new
    end
  end

  def destroy
    if @time_slot.destroy
      flash[:info] = "Time slot destroyed successfully"
      redirect_to admin_time_slots_path
    else
      flash[:danger] = @time_slot.errors.full_messages
      render :new
    end    
  end

  private
    def time_slot_params
      params.require(:time_slot).permit(:start_date, :start_time, :end_date, :end_time, :is_special)
    end

    def set_record
      @time_slot = TimeSlot.find params[:id]
    end
end

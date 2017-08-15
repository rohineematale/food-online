class Admin::FoodItemsController < Admin::BaseController

  before_action :set_record, only: [:edit, :update, :destroy]

  layout "admin"

  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
    @food_item.build_photo
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    if @food_item.save
      @food_item.time_slots = TimeSlot.where("id IN (?)", food_item_params['time_slot_ids'])
      flash[:info] = "Food item record created successfully"
      redirect_to admin_food_items_path
    else
      @food_item.build_photo unless @food_item.photo
      flash[:danger] = @food_item.errors.full_messages
      render :new
    end
  end

  def edit
    @food_item.build_photo unless @food_item.photo
  end

  def update
    if @food_item.update_attributes(food_item_params)
      @food_item.time_slots = TimeSlot.where("id IN (?)", food_item_params['time_slot_ids'])
      flash[:info] = "Food item record updated successfully"
      redirect_to admin_food_items_path
    else
      @food_item.build_photo unless @food_item.photo
      flash[:danger] = @food_item.errors.full_messages
      render :new
    end
  end

  def destroy
    if @food_item.destroy
      flash[:info] = "Food item record destroyed successfully"
      redirect_to admin_food_items_path
    else
      flash[:danger] = @food_item.errors.full_messages
      render :new
    end    
  end

  private
    def food_item_params
      params.require(:food_item).permit(:name, :price, :description, time_slot_ids: [], photo_attributes: [:image, :id], time_slot_ids: [])
    end

    def set_record
      @food_item = FoodItem.friendly.find params[:id]
    end
end

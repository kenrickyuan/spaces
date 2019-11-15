class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
      # @spaces = policy_scope(Space.filter(params[:query])) # <= whole pg_search_scope goes in here
      filter_location
      filter_availability if params[:checkin].present? && params[:checkout].present?
      filter_category if params[:category].present?
      filter_max_occupancy if params[:max_occupancy].present?
      filter_price_per_hour if params[:price_per_hour].present?
      policy_scope(@spaces)
      set_markers
    # else
    #   @spaces = policy_scope(Space.all)
    #   set_markers
    # end
  end

  def show
    @booking = Booking.new
    @user = current_user
  end

  def new
    @user = current_user
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    authorize @space
    @space.owner = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @space.update(space_params)
    redirect_to space_path(@space)
  end

  def destroy
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :location, :category, :price_per_hour, :max_occupancy, :photo)
  end

  def set_space
    @space = Space.find(params[:id])
    authorize @space
  end

  def filter_location
    @spaces = Space.where(location: params[:location])
  end

  def filter_category
    @spaces = @spaces.where(category: params[:category])
  end

  def filter_max_occupancy
    @spaces = @spaces.where('max_occupancy >= ?', params[:occupancy])
  end

  def filter_price_per_hour
    @spaces = @spaces.where('price_per_hour >= ?', params[:price])
  end

  def filter_availability
    @bookings = Booking.where('start_time > ? and end_time < ?', params[:checkin], params[:checkout])

    space_ids = @bookings.map(&:space_id)
    @spaces = @spaces.where.not(id: space_ids)
  end

  def set_markers
    @spaces_geocoded = @spaces.geocoded
    @markers = @spaces_geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude
      }
    end
  end
end

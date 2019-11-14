class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      # @spaces = policy_scope(Space.filter(params[:query])) # <= whole pg_search_scope goes in here

      @spaces = Space.where(@space.location == params[:location])

      if params[:category].present?
        @spaces = Space.where(Space.filter(params[:category]))
      end

      if params[:max_occupancy].present?
        @spaces = Space.where(Space.max_occupancy >= params[:occupancy])
      end

      if params[:price_per_hour].present?
        @spaces = Space.where(Space.price_per_hour >= params[:price])
      end

      policy_scope(@spaces)
    else
      @spaces = policy_scope(Space.all)
    end
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
end

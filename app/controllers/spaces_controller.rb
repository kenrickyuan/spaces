class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    @spaces = policy_scope(Space)
  end

  def show
    authorize @space
    @booking = Booking.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    authorize @space
    @space.user = current_user
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    authorize @space
  end

  def update
    authorize @space
    @space.update(space_params)
    redirect_to space_path(@space)
  end

  def destroy
    authorize @space
    @space.destroy
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:description, :location, :category, :price_per_hour, :max_occupancy, :photo)
  end

  def set_space
    @space = Space.find(params[:id])
  end
end

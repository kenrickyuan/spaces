class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_space, only: [:new, :create]

  def index
    # All User bookings
    @user_bookings = policy_scope(Booking)
    # All Space owner bookings
    @spaces = current_user.spaces
    @space_bookings = @spaces.flat_map { |space| space.bookings }
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.space = @space
    @booking.user = current_user
    if @booking.save!
      redirect_to user_space_booking_path(current_user.id, @booking.space.id, @booking.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to space_booking_path(@space)
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_space
    @space = Space.find(params[:space_id])
    authorize @space, :show?
  end
end

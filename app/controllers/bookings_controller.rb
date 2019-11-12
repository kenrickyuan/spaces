class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_bookings = policy_scope(Booking)
    # @space_bookings = policy_scope([:space, Booking])
    # /policies/space/booking_policy.rb
    @spaces = current_user.spaces
    @space_bookings = @spaces.flat_map { |space| space.bookings }
  end

  def show
    @booking = Booking.find(params[:id])
    @booking_space = @booking.space
    authorize @booking
  end

  def new
    @space = Space.find(params[:space_id])
    authorize @space, :show?
    @booking = Booking.new
    autorize @booking
  end

  def create
    @booking = Booking.new(params_permit)
    @space = Space.find(params[:space_id])
    authorize @space, :show?
    @booking.space = @space
    if @booking.save
      redirect_to space_path(@space)
    else
      render 'spaces#show'
    end
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params_permit)
    redirect_to space_booking_path(:space_id)
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
  end

  private

  def params_permit
    params.require("booking").permit(:startime, :endtime)
  end
end

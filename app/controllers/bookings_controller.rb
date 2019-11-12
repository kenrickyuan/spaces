class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_permit)
    @space = Space.find(params[:space_id])
    @booking.space = @space
    if @booking.save
      redirect_to space_path(@space)
    else
      render 'spaces#show'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params_permit)
    redirect_to space_booking_path(:space_id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def params_permit
    params.require("booking").permit(:startime, :endtime)
  end
end

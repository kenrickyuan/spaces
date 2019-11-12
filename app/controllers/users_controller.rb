class UsersController < ApplicationController
  def show
    @user = current_user
    @spaces = @user.spaces
    @user_bookings = @user.bookings
    authorize @user
  end
end

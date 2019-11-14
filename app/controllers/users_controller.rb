class UsersController < ApplicationController
  def show
    @user = current_user
    @spaces = @user.spaces
    @user_bookings = @user.bookings
    authorize @user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
    authorize current_user
  end

  def edit
    @user = current_user
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :photo)
  end
end

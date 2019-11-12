class UsersController
  def show
    @user = current_user
    @user_bookings = @user.bookings
    @spaces = @user.spaces
  end
end

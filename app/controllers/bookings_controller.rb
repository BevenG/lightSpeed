class BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @starship = Starship.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.starship = @starship
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_date, :end_date)
  end
end

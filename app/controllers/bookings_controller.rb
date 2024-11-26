class BookingsController < ApplicationController
  def index
    @my_bookings = Booking.where(user: current_user)
  end

  def new
    @starship = Starship.find(params[:starship_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @starship = Starship.find(params[:starship_id])
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

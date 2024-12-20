class BookingsController < ApplicationController
  def index
    all_bookings = Booking.all
    @starships = Starship.where(user: current_user)
    @bookings = []
    @starships.each do |starship|
      all_bookings.each do |booking|
        @bookings << booking if booking.starship == starship
      end
    end
    @my_bookings = Booking.where(user: current_user)
  end

  def new
    @starship = Starship.find(params[:starship_id])
    @booking = Booking.new
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approved!
    respond_to do |format|
      format.html{ redirect_to starship_path(@booking.starship), notice: "Booking approved!" }
      format.js
    end
    # @booking.update(status: 'approved')
    # redirect_to @booking, notice: 'Booking was successfully approved.'
    # @booking = Booking.find(params[:id])
    # @booking.status = 'approved'
    # @booking.save

    # redirect_to bookings_path, notice: 'booking approved successfully.'
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.rejectd!
    respond_to do |format|
      format.html{ redirect_to starship_path(@booking.starship), notice: "Booking rejected!" }
      format.js
    end
    # @booking.update(status: 'declined')
    # redirect_to @booking, notice: 'Booking was successfully declined.'
    # @booking = Booking.find(params[:id])
    # @booking.status = 'declined'
    # @booking.save

    # redirect_to bookings_path, notice: 'booking declined successfully.'
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

  def edit
    @starship = Starship.find(params[:id])
  end

  def update
    @starship = Starship.find(params[:id])
    if @starship.update(starship_params)
      redirect_to starships_path, notice: 'starship updated successfully.'
    else
      render :edit, alert: 'Failed to update starship.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :starship_id, :user_id)
  end

  def starship_params
    params.require(:starship).permit(:name, :description, :price, :top_speed, :upgrades, :mass, :weapons, :photo)
  end
end

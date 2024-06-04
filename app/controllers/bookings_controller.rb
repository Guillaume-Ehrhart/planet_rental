class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_planet, only: %i[new create accept reject]
  before_action :set_booking, only: %i[accept reject]

  def new
    @booking = @planet.bookings.build
  end

  def create
    @booking = @planet.bookings.build(booking_params.merge(user: current_user, status: 'pending'))
    if @booking.save
      redirect_to planet_booking_path(@planet, @booking), notice: 'Booking request sent.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @planet = @booking.planet
  end

  def accept
    if @booking.planet.user == current_user
      @booking.update(status: 'accepted')
      redirect_to dashboard_path, notice: 'Booking accepted.'
    else
      redirect_to dashboard_path, alert: 'Not authorized.'
    end
  end

  def reject
    if @booking.planet.user == current_user
      @booking.update(status: 'rejected')
      redirect_to dashboard_path, notice: 'Booking rejected.'
    else
      redirect_to dashboard_path, alert: 'Not authorized.'
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:planet_id, :start_date, :end_date, :status)
  end
end
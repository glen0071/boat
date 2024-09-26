class JailBookingsController < ApplicationController
  before_action :set_jail_booking, only: %i[show edit update destroy]

  # GET /jail_bookings
  def index
    @jail_bookings = JailBooking.includes(:case_charges).all
  end

  # GET /jail_bookings/1
  def show; end

  # GET /jail_bookings/new
  def new
    @jail_booking = JailBooking.new
  end

  # GET /jail_bookings/1/edit
  def edit; end

  # POST /jail_bookings
  def create
    @jail_booking = JailBooking.new(jail_booking_params)

    if @jail_booking.save
      redirect_to @jail_booking, notice: 'Jail booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jail_bookings/1
  def update
    if @jail_booking.update(jail_booking_params)
      redirect_to @jail_booking, notice: 'Jail booking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /jail_bookings/1
  def destroy
    @jail_booking.destroy
    redirect_to jail_bookings_url, notice: 'Jail booking was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jail_booking
    @jail_booking = JailBooking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def jail_booking_params
    params.require(:jail_booking).permit(:number, :full_name, :age_at_booking, :inmate_number, :custody_status,
                                         :housing_location, :received_date_time, :arrested_by, :released_date_time, :city, :state)
  end
end

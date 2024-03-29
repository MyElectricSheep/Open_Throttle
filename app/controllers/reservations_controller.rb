class ReservationsController < ApplicationController
  def index 
    @reservation=Reservation.all 
  end

  def new
    @reservation = Reservation.new 
  end

  def create

    @reservation = Reservation.new(reservation_params)
    @customer = @reservation.user
    @host = User.find(@reservation.vehicle.user_id)
    @reservation.pay_check = true
    @days = @reservation.check_out_date - @reservation.check_in_date
    @vehicle = Vehicle.find(@reservation.vehicle_id)
    @total_price = @days * @vehicle.price_per_day
    @reservation.total_price = @total_price
    if @reservation.save 
        redirect_to @vehicle
    else 
      flash[:alert]="The dates you have chosen are not available, please select other dates!"
      redirect_to vehicle_path(@reservation.vehicle.id)
  end
end 

  def show
    @reservation=Reservation.find(params[:id])
    @vehicle=Vehicle.find(@reservation.vehicle_id)
    @user = User.find(@vehicle.user_id)
  end

  def edit
    @reservation =Reservation.find(params[:id])

  end

  def update
    @reservation = Reservation.find(params[:id])
      if@reservation.update(reservation_params)
        redirect_to @reservation
      else 
        render 'edit' #use current controller to show another pages 
  end
end 

  def destroy
    @reservation=Reservation.find(params[:id])
    @reservation.destroy
    redirect_to vehicle_path #will go thru  controller and upload another pages 
  end



  private

  def reservation_params
    params.require(:reservation).permit(:vehicle_id, :user_id, :check_in_date , :check_out_date)
  end
end



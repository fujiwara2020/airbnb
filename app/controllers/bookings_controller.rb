class BookingsController < ApplicationController

    before_action :authenticate_user!

    def index
        @bookings = Booking.where(user_id: current_user.id)

        
    end

    def new
        @room = Room.find(params[:room_id])
        @booking = Booking.new
    end
    
    def create
        
        @booking = Booking.new(booking_params)
        
        # binding.pry
        
        if @booking.save
            redirect_to room_booking_path(@booking.room_id, @booking)

            flash[:notice] = "予約しました"
        else
            redirect_to new_booking_path
        end
        
    end
    
    def show
        @booking = Booking.find(params[:id])
        @room = Room.find(params[:room_id])
        @total_fee = (@booking.end_date - @booking.start_date).to_int * @booking.people * @room.fee
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :people, :user_id, :room_id)
    end


end

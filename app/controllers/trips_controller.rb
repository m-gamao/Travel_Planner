class TripsController < ApplicationController
    def new
      @trip = Trip.new
    end
  
    def create
        @trip = Trip.new(trip_params).merge(user_id: @current_user.id)
        if @trip.save
        redirect_to trip_path(@trip)
        else
          render :new    
        end
    end

    def index
      @trips = Trip.all
    end
  
    def edit
    end
  
    def show
    end

      
  private
  
  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id)
  end
end


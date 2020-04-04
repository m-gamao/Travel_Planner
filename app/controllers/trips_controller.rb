class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @trip.destinations.build
  end

  def create
    @trip = Trip.create(trip_params.merge(user_id: current_user.id))
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
    set_trip
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    set_trip
    @trip.update(trip_params)
    redirect_to trip_path(@trip)    
  end
        
private

def set_trip
  @trip = Trip.find(params[:id])
end

def trip_params
  params.require(:trip).permit(:name, :start_date, :end_date, :user_id, destinations_attributes: [:name])
end
end

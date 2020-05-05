class TripsController < ApplicationController
  before_action :set_trip, only: [:edit, :show, :update]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params.merge(user_id: current_user.id))
    byebug
    # @trip.user = current_user
    if @trip.save
    redirect_to trip_path(@trip)
    else
    render :new    
    end
  end

  def index
    @trips = current_user.trips
  end

  def edit
  end

  def show
  
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)    
  end
       
  private

  def set_trip
    @trip = Trip.find(params[:id])
  end


  #:destination_ids is plural because has_many :destinations is plural
  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :user_id, :destination_ids, 
    destinations_attributes: [:name])
  end

end

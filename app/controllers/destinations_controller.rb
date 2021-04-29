  class DestinationsController < ApplicationController
    before_action :set_dest, only: [:edit, :show, :update, :destroy]

    def new  
      @trip = Trip.find(params[:trip_id])
      @destination = @trip.destinations.build
    end

    def index
      @trip = Trip.find(params[:trip_id])
      @destinations = @trip.destinations
    end
 
    def create
      @trip = Trip.find(params[:trip_id])
      @destination = @trip.destinations.create(destination_params.merge(user_id: current_user.id))
      if @destination.valid?
        @destination.save
        redirect_to destination_path(@destination)
      else
        flash[:message] = "The data you entered is not valid...Please try again."
        render :new    
      end
    end

    def edit
    end
    
    def show

    end

    def update
      @destination.update(name: params[:destination][:name], location: params[:destination][:location], description: params[:destination][:description])
      redirect_to destination_path(@destination)
    end

    def destroy
      @trip = @destination.trip
      if @destination.present?
      @destination.destroy
      end
      redirect_to trip_path(@trip)
    end

    private

    def set_dest 
      @destination = Destination.find(params[:id])
    end    
  
    def destination_params
      params.require(:destination).permit(:name, :location, :description, :user_id, :trip_id) 
    end
  end



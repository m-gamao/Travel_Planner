  class DestinationsController < ApplicationController
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
      
      if @destination.save

      redirect_to destination_path(@destination)
      else
        render :new    
      end
    end

      def edit
        @destination = Destination.find(params[:id])
      end
    
      def show
        @destination = Destination.find(params[:id])
      end
  
      def search
        @destination = Note.most_recent
      end

      def update
        @destination = Destination.find(params[:id])
        @destination.update(name: params[:destination][:name], location: params[:destination][:location], description: params[:destination][:description])
        redirect_to destination_path(@destination)
      end

  def destroy
    @destination = Destination.find(params[:id])
    @trip = @destination.trip
    if @destination.present?
      @destination.destroy
    end
    redirect_to trip_path(@trip)
  end

    private
    
  
    def destination_params
      params.require(:destination).permit(:name, :location, :description, :user_id, :trip_id) 
    end
  end



  class DestinationsController < ApplicationController
    def new
      @trip = Trip.find_by(params[:trip_id])
      @destination = @trip.destinations.build
      @note = Note.new
      
    end

    def index
      @destinations = Destination.all
    end
 
    def create
      @trip = Trip.find_by(params[:trip_id])
      render :new if @trip.nil?
    
      @destination = @trip.destinations.create(destination_params.merge(user_id: current_user.id))
      @destination.create_note({content: params[:destination][:note]})
      if @destination.save

      redirect_to destination_path(@destination)
      else
        render :new    
      end
    end

      def edit
        set_destination
      end
    
      def show
        set_destination
      end
  
      def update
        set_destination
        @destination.update(destination_params)
        redirect_to destination_path(@destination)    
      end

    private
    
    def set_destination
      @destination = Destination.find(params[:id])
    end
  
    def destination_params
      params.require(:destination).permit(:name, :location, :description, :user_id, :trip_id) 
    end
  end



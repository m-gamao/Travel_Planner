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
        @destination = Destination.find_by(params[:trip_id])
      end
    
      def show
        @destination = Destination.find_by(params[:trip_id])
      end
  
      def update
        set_destination
        @destination.update(destination_params)
        redirect_to destination_path(@destination)    
      end

      
  def destroy
    Destination.find_by(params[:trip_id]).destroy
    redirect_to trip_path
  end

    private
    
  
    def destination_params
      params.require(:destination).permit(:name, :location, :description, :user_id, :trip_id) 
    end
  end



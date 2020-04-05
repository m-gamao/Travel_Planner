  class DestinationsController < ApplicationController
    def new
      @trip = Trip.new
      @destination = @trip.destinations.build
      @note = @destination.notes.build
    end

    def index
      @destinations = Destination.all
    end
 
    def create
      @trip = Trip.find_by(params[:trip_id])
      render :new if @trip.nil?
    
      @destination = @trip.destinations.create(destination_params.merge(user_id: current_user.id))
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
        @destination = Destination.find_by(params[:trip_id])
        @destination.update(destination_params)
        redirect_to trip_destination_path(@destination)    
      end

  def destroy
    @destination = Destination.find_by(params[:trip_id])
    if @destination.present?
      @destination.destroy
    end
    redirect_to root_url
end
    private
    
  
    def destination_params
      params.require(:destination).permit(:name, :location, :description, :user_id, :trip_id) 
    end
  end



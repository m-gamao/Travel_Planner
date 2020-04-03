class LocationsController < ApplicationController
    def new
      @location = Location.new
    end
        
    def create
      @location = Location.create(location_params)
      redirect_to location_path(@location)
    end

    def edit

    end

    def index
      @location = Location.all
    end
    
    def show
      @location = Location.find_by(id: params[:id])
    end

    def update
    end

    private

    def location_params
      params.require(:location).permit(:name, :description)
    end

end

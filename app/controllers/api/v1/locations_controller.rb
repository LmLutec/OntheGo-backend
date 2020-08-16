class Api::V1::LocationsController < ApplicationController

    def index
        locations = Location.all 
        render json: locations
    end 

    def create
       location = Location.create(locations_params)

       if location.valid?
            render json: location
       else 
            render json: location.errors.messages
       end 
       
    end 

    def show
        # set up to display single location with trucks? Users type in city and state, then fetch show and use find_by method
    end 


private

def locations_params
    params.require(:location).permit(:city, :state)
end 

end

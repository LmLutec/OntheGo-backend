class Api::V1::LocationsController < ApplicationController

    def create
        CS.states(:us).each do |s|
            if "#{s[0]}" == "#{locations_params["state"]}" 
            #    first letter of cities need to be capitalized, states are two characters long and capitalized (e.g. VA)
                CS.cities("#{s[0]}").each do |city|
                    if "#{city}" == "#{locations_params["city"]}"
                        location = Location.create(locations_params)
                        render json: location
                    end
                end 
            end
        end
         
    end 




private

def locations_params
    params.require(:location).permit(:city, :state, :foodtruck_id)
end 

end

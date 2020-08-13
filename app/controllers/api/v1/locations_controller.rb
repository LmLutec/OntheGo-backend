class Api::V1::LocationsController < ApplicationController

    def create
       location = Location.create(locations_params)
        render json: location
        # find_location = Location.find_by(city: "#{locations_params["city"]}", state: "#{locations_params["state"]}")
        
        # if !find_location
            # CS.states(:us).each do |s|
            #     CS.cities("#{s[0]}").each do |city| puts city 
            #         tester = Location.create(city: city, state: "#{s[0]}")
            #     end
            # end
                # byebug
                # if "#{s[0]}" == "#{locations_params["state"]}" 
                #    first letter of cities need to be capitalized, states are two characters long and capitalized (e.g. VA)
        #             CS.cities("#{s[0]}").each do |city|
        #                 if "#{city}" == "#{locations_params["city"]}"
        #                     location = Location.create(locations_params)
        #                     render json: location
        #                 end
        #             end 
        #         end
        #     end
        # else
        #     find_location
        # end 
    end 




private

def locations_params
    params.require(:location).permit(:city, :state)
end 

end

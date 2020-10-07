class RatingsController < ApplicationController

    def index
    end 

    def create
        rating = Rating.create(rating_params)

        if rating 
            render json: rating 
        else 
            render json: rating.errors.messages
        end 
    end 




private

def rating_params
    params.require(:rating).permit(:food, :customer_service, :speed_of_service, :foodtruck_id)
end



end

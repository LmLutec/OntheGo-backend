class Api::V1::RatingsController < ApplicationController
    def index
        ratings = Rating.all
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
    params.require(:rating).permit(:food_quality, :customer_service, :speed_of_service, :prices, :foodtruck_id)
end

end

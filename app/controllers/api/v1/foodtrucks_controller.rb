class Api::V1::FoodTrucksController < ApplicationController

    def create
        food_truck = FoodTruck.create(food_truck_params)
        render json: food_truck 
    end 









private

    def food_truck_params
        params.require(:food_truck).permit(:name, :food_type, :phone_number, :owner_id)
    end

end

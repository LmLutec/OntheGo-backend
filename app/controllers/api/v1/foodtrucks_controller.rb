class Api::V1::FoodtrucksController < ApplicationController

    def create
        food_truck = Foodtruck.create(food_truck_params)
        render json: food_truck 
    end 









private

    def food_truck_params
        params.require(:food_truck).permit(:name, :food_type, :phone_number, :owner_id)
    end

end

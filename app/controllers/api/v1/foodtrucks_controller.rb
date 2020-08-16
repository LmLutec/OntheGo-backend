class Api::V1::FoodtrucksController < ApplicationController

    def create
        foodtruck = Foodtruck.create(food_truck_params)

        # options = {
        #     include: [:location]
        # }
        render json: FoodtruckSerializer.new(foodtruck)
    end 









private

    def food_truck_params
        params.require(:foodtruck).permit(:name, :food_type, :phone_number, :owner_id, :location_id)
    end

end

class Api::V1::FoodtrucksController < ApplicationController

    def index
        foodtrucks = Foodtruck.all
        render json: foodtrucks
    end 

    def create
        foodtruck = Foodtruck.create(food_truck_params)

        # options = {
        #     include: [:location]
        # }
        render json: FoodtruckSerializer.new(foodtruck)
    end 

    def show
        foodtruck = Foodtruck.where(location_id: params[:foodtruck][:location_id])
        render json: foodtruck
    end 







private

    def food_truck_params
        params.require(:foodtruck).permit(:name, :food_type, :phone_number, :owner_id, :location_id)
    end

end

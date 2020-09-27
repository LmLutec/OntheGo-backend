class Api::V1::FoodtrucksController < ApplicationController

    def index
        foodtrucks = Foodtruck.all
        render json: FoodtruckSerializer.new(foodtrucks).to_serialized_json
    end 

    def create
        if Foodtruck.check_location(params) == true
            foodtruck = Foodtruck.create(food_truck_params)
            if foodtruck.valid?
                render json: FoodtruckSerializer.new(foodtruck).to_serialized_json 
            else 
                render json: foodtruck.errors.messages
            end  
        end 
    end 

    def show
        foodtruck = Foodtruck.where(city: params[:city], state: params[:state])
        render json: foodtruck
    end 







private

    def food_truck_params
        params.require(:foodtruck).permit(:name, :food_type, :phone_number, :city, :state, :owner_id)
    end

end

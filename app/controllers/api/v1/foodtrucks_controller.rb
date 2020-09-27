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

    def search
        # food_truck_params[:city] = food_truck_params[:city].capitalize
        # food_truck_params[:state] = food_truck_params[:state].upcase

        foodtruck = Foodtruck.where(city: food_truck_params[:city].capitalize, state: food_truck_params[:state].upcase)
        render json: foodtruck
    end 







private

    def food_truck_params
        params.require(:foodtruck).permit(:name, :food_type, :phone_number, :city, :state, :owner_id)
    end

end

class Api::V1::FoodtrucksController < ApplicationController
    before_action :authorized, only: [:profile]


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
        foodtruck = Foodtruck.find_by(id: params[:id])
        if foodtruck.valid?
            render json: FoodtruckSerializer.new(foodtruck).to_serialized_json
        else 
            render foodtruck.errors.messages
        end 
    end 

    def update
        food_truck_params[:city] = food_truck_params[:city].capitalize
        food_truck_params[:state] = food_truck_params[:state].upcase

        foodtruck = Foodtruck.find_by(id: food_truck_params[:id])
        # byebug
        if foodtruck.valid?
            foodtruck.update(food_truck_params)
        else 
            render json: foodtruck.errors.messages
        end 
    end 

    def profile
        truck = current_user.foodtruck
     
        render json: FoodtruckSerializer.new(truck).to_serialized_json 
    end 


    def search
        foodtrucks = Foodtruck.where(city: food_truck_params[:city].capitalize, state: food_truck_params[:state].upcase)
        render json: FoodtruckSerializer.new(foodtrucks).to_serialized_json
    end 






private

    def food_truck_params
        params.require(:foodtruck).permit(:id,:name, :food_type, :phone_number, :street, :city, :state, :zip_code, :owner_id)
    end

end

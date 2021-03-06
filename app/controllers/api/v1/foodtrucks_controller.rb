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
                render json: {message: foodtruck.errors.messages}
            end  
        end 
    end 

    def show 
        foodtruck = Foodtruck.find_by(id: params[:id])
        if foodtruck.valid?
            render json: FoodtruckSerializer.new(foodtruck).to_serialized_json
        else 
            render json: {message: foodtruck.errors.messages}
        end 
    end 

    def update
        if Foodtruck.check_location(params) == true

            foodtruck = Foodtruck.find_by(id: food_truck_params[:id])

            if foodtruck.valid?
                foodtruck.update(food_truck_params)
                render json: foodtruck
            else 
                render json: {message: foodtruck.errors.messages}
            end 
        end 
    end 

    def profile
        truck = current_user.foodtruck
    
        if truck.valid?
            render json: FoodtruckSerializer.new(truck).to_serialized_json 
        else 
            render json: {message: truck.errors.messages}
        end 
    end 


    def search
        foodtrucks = Foodtruck.where(city: food_truck_params[:city].capitalize, state: food_truck_params[:state].upcase)
        if foodtrucks != nil && foodtrucks != []
            render json: FoodtruckSerializer.new(foodtrucks).to_serialized_json
        else 
            render json: { message: "Check spelling of city and state. Or Foodtrucks may not be in your area yet!"}
        end 
    end 

    def like
        foodtruck = Foodtruck.find_by(id: food_truck_params[:id])
    
        if foodtruck.valid?
            foodtruck.update(food_truck_params)
            # byebug
            render json: FoodtruckSerializer.new(foodtruck).to_serialized_json
        else 
            render json: {message: foodtruck.errors.messages}
        end 
    end 





private

    def food_truck_params
        params.require(:foodtruck).permit(:id,:name, :food_type, :phone_number, :street, :city, :state, :zip_code, :likes, :owner_id)
    end

end

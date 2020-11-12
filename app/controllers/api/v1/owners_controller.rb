class Api::V1::OwnersController < ApplicationController

    def index
        owners = Owner.all 
        render json: OwnerSerializer.new(owners).to_serialized_json
        # json: owners 
    end 

    def create
        owner = Owner.create(owner_params)
        
        if owner.valid? 
            token = encode_token(owner_id: owner.id)
            render json: { owner: owner, jwt: token}, status: :created 
        else 
            render json: {message: owner.errors.messages} 
        end 
    end 

    def destroy
        owner = Owner.find_by(id: owner_params[:id])
        truck = owner.foodtruck
        truck.destroy
        owner.destroy
    end 





    private

    def owner_params
        params.require(:owner).permit(:id, :first_name, :last_name, :email, :password, :password_digest, :updated_at, :created_at)
    end




end






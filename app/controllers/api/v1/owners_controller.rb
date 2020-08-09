class Api::V1::OwnersController < ApplicationController

    def create
        owner = Owner.create(owner_params)

        if owner.valid? 
            token = encode_token(owner_id: owner.id)
            render json: { owner: owner, jwt: token}, status: :created 
            byebug
        end 
    end 














    private

    def owner_params
        params.require(:owner).permit(:first_name, :last_name, :username, :password)
    end




end

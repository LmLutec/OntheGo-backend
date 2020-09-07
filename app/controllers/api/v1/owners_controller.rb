class Api::V1::OwnersController < ApplicationController
    before_action :authorized, only: [:profile]

    def index
        owners = Owner.all 
        render json: owners 
    end 

    def create
        owner = Owner.create(owner_params)
        if owner.valid? 
            token = encode_token(owner_id: owner.id)
            render json: { owner: owner, jwt: token}, status: :created 
                # owner: OwnerSerializer.new(owner), jwt: token}.to_serialized_json, status: :created 
        else 
            render json: owner.errors.messages 
        end 
    end 


    def profile
        # byebug
        # owner = Owner.find_by(email: params[:owner][:email])
        render json: current_user
    end 










    private

    def owner_params
        params.require(:owner).permit(:first_name, :last_name, :email, :password_digest)
    end




end






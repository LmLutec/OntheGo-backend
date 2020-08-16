class Api::V1::AuthController < ApplicationController


    def create
        owner = Owner.find_by(email: login_params[:email])

        if owner && owner.authenticate(login_params[:password])
            token = encode_token({ owner_id: owner.id })
            render json: { owner: owner, jwt: token }, status: :accepted
        # else 
            # render json { message: "Invalid username or password" }, status: :unauthorized
        end 
    end













private

    def login_params
        params.require(:owner).permit(:email, :password)
    end 
end



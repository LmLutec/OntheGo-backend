class Api::V1::AuthController < ApplicationController

    def create
        owner = Owner.find_by(username: login_params[:username])

        if owner && owner.authenicate(login_params[:password])
            token = encode_token({ owner_id: owner.id })
        end 
    end













private

    def login_params
        params.require(:owner).permit(:username, :password)
    end 
end

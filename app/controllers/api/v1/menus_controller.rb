class Api::V1::MenusController < ApplicationController

    def create 
        menu = Menu.create(menu_params)

        if menu.valid?
            render json: menu
        else 
            render json: menu.errors.messages
        end 
    end 









private

def menu_params
    params.require(:menu).permit(:foodtruck_id)
end


end

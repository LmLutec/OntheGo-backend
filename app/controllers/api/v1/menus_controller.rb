class Api::V1::MenusController < ApplicationController

    def create 
        menu = Menu.create(menu_params)
        render json: menu
    end 









private

def menu_params
    params.require(:menu).permit(:foodtruck_id)
end


end

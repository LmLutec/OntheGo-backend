class Api::V1::ItemsController < ApplicationController

    def create
        item = Item.create(item_params)

        if item.valid?
            render json: item 
        else 
            render json: item.error.messages
        end 
    end 






private

def item_params
    params.require(:item).permit(:name, :price, :menu_id)
end 


end

class Api::V1::ItemsController < ApplicationController

    def create
        item = Item.create(item_params)
    end 






private

def item_params
    params.require(:item).permit(:name, :price, :menu_id)
end 


end

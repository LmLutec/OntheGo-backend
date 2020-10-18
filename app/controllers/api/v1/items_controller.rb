class Api::V1::ItemsController < ApplicationController

    def create

        item = Item.create(item_params)

        if item.valid?
            render json: item 
        else 
            render json: item.errors.messages
        end 
    end 

    def destroy
        item = Item.find_by(id: item_params[:id])
        if item.valid?
            item.destroy
        else 
            item.errors.messages
        end
    end 
    




private

def item_params
    params.require(:item).permit(:id, :name, :item_type, :price, :description, :menu_id, :created_at, :updated_at)
end 


end

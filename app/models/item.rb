class Item < ApplicationRecord
    belongs_to :menu

    validates :name, :item_type, :price, :description, presence: true
end

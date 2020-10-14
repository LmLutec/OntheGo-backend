class Item < ApplicationRecord
    belongs_to :menu

    validates :name, :type, :price, presence: true
end

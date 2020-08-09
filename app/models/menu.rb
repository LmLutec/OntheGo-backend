class Menu < ApplicationRecord
    belongs_to :foodtruck
    has_many :items
end

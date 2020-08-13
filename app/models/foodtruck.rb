class Foodtruck < ApplicationRecord
    belongs_to :owner
    belongs_to :location
    has_one :schedule
    has_one :menu
    


end

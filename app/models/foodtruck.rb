class Foodtruck < ApplicationRecord
    belongs_to :owner
    has_one :schedule
    has_one :menu
    has_one :location


end

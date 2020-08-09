class Foodtruck < ApplicationRecord
    belongs_to :owner
    has_one :schedule


end

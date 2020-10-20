class Rating < ApplicationRecord
    belongs_to :foodtruck
    validates :food_quality, :customer_service, :speed_of_service, :prices, presence: true


    

end



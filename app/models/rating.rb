class Rating < ApplicationRecord
    belongs_to :foodtruck
    validates :food_quality, :customer_service, :speed_of_service, :prices, presence: true


    def self.overall_food_quality(params)
        ratings = Rating.where(foodtruck_id: params["foodtruck_id"])
        food_average = ratings.average(:food_quality) 
        
        # / 3 * 100 
        byebug
        # number_to_percentage(food_average, strip_insignificant_zeros: true) 
        # byebug
        # ratings.average(:food_quality) 
    end 


end

# def avg_satisfied(location)
#     @reviews = location.reviews 
#     a = @reviews.average(:satisfaction) / 4 * 100
#     number_to_percentage


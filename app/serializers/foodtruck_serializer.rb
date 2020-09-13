class FoodtruckSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :food_type, :phone_number, :city, :state
  belongs_to :owner
  # belongs_to :location

  # def initialize(truck)
  #   @truck = truck
  # end
 
  # def to_serialized_json
  #   @truck.to_json(:include => {
  #     :foodtruck
  # },
  #      :except => [:updated_at])
  # end
end

# For truck ratings
# class UserSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :username
#   attributes :high_score do |object|
#     object.games.map(&:score).max
#   end
# end
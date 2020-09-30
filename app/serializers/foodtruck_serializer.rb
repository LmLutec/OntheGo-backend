class FoodtruckSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :food_type, :phone_number, :city, :state
  belongs_to :owner
  has_one :schedule
  has_one :menu
  

  def initialize(truck)
    @truck = truck
  end
 
  def to_serialized_json
    @truck.to_json(:include => {
      :schedule => {:except => [:foodtruck_id, :created_at, :updated_at]},
      :menu => {:except => [:created_at, :updated_at]},
  }, 
    :except => [:created_at, :updated_at])
  end
end

# For truck ratings
# class UserSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :username
#   attributes :high_score do |object|
#     object.games.map(&:score).max
#   end
# end
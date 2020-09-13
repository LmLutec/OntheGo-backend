class Foodtruck < ApplicationRecord
    belongs_to :owner
    # belongs_to :location
    has_one :schedule
    has_one :menu
    
    validates :name, :food_type, :phone_number, :city, :state, presence: true 
    validates :name, uniqueness: true
    validates :state, length: { is: 2 }

    def self.check_location(params)
        
        params["foodtruck"]["city"] = params["foodtruck"]["city"].capitalize
        params["foodtruck"]["state"] = params["foodtruck"]["state"].upcase

        CS.states(:us).each do |s|
            if "#{params["foodtruck"]["state"]}" == "#{s[0]}"
                CS.cities("#{s[0]}").each do |c|
                    if "#{params["foodtruck"]["city"]}" == "#{c}"
                       return true 
                        # Location.find_or_create_by(city: params["city"], state: "#{s[0]}")
                    end 
                end 
            end
        end
    end 
end

class Foodtruck < ApplicationRecord
    belongs_to :owner
    has_many :notes
    has_many :ratings
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
                    end 
                end 
            end
        end
    end 
end

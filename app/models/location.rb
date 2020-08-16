class Location < ApplicationRecord
    has_many :foodtrucks

    validates :city, :state, presence: true
    validates :state, length: { is: 2 }

    def self.check_location(params)
        CS.states(:us).each do |s|
            if "#{params["state"]}" == "#{s[0]}"
                CS.cities("#{s[0]}").each do |c|
                    if "#{params["city"]}" == "#{c}"
                       return Location.find_or_create_by(city: params["city"], state: "#{s[0]}")
                    end 
                end 
            end
        end
    end 

end

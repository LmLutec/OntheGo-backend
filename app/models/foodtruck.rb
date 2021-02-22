class Foodtruck < ApplicationRecord
    belongs_to :owner
    has_many :notes
    has_many :ratings
    has_one :schedule
    has_one :menu
    has_many :items, through: :menu
    
    validates :name, :food_type, :phone_number, :street, :city, :state, :zip_code, presence: true 
    validates :phone_number, length: { is: 10 }
    validates :state, length: { is: 2 }
    validates :zip_code, length: { is: 5 }
    validates :phone_number, uniqueness: true
    # validates_format_of :phone_number, with: /\d\d\d-\d\d\d-\d\d\d\d/, :on => :create
    
 
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




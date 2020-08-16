class Location < ApplicationRecord
    has_many :foodtrucks

    validates :city, :state, presence: true
    validates :state, length: { is: 2 }

    def get_location
    end 

end

class Owner < ApplicationRecord
    has_secure_password
    has_one :food_truck

end

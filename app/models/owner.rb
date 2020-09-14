class Owner < ApplicationRecord
    has_secure_password
    has_one :foodtruck

    validates :first_name, :last_name, :email, :password, presence: true
    validates :email, uniqueness: true 
end



class Note < ApplicationRecord
    belongs_to :foodtruck
    validates :date, :message, presence: true
end

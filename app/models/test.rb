class Test < ApplicationRecord
    has_many :metrics
    has_many :appointments
end

class Test < ApplicationRecord
    has_many :metrics, :appointments
end

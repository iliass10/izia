class Appointment < ApplicationRecord
  has_many :appointments
  belongs_to :user
  belongs_to :test
end

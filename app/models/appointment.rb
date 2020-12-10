class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :results
end

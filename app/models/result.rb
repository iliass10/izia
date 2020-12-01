class Result < ApplicationRecord
  belongs_to :metric
  belongs_to :appointment
end

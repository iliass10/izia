class Metric < ApplicationRecord
  has_many :results
  belongs_to :test
end

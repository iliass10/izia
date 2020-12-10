class Metric < ApplicationRecord
  has_many :results, dependent: :destroy
  belongs_to :test
end

class Test < ApplicationRecord
  has_many :metrics, dependent: :destroy
  has_many :appointments, dependent: :destroy
end

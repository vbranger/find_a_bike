class Station < ApplicationRecord
  reverse_geocoded_by :lat, :lon
  after_validation :reverse_geocode
  has_many :results, dependent: :destroy
end

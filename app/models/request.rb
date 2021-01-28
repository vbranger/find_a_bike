class Request < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :stations, through: :results
end

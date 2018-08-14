class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :supplier
  belongs_to :service

  validates :datetime, :duration, :presence => true
end
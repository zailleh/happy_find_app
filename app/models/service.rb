# == Schema Information
#
# Table name: services
#
#  id :bigint(8)        not null, primary key
#

class Service < ApplicationRecord
  belongs_to :supplier
  belongs_to :skill
  has_many :orders

  validates :cost, :presence => true
end

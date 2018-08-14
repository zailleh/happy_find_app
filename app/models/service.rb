# == Schema Information
#
# Table name: services
#
#  id          :bigint(8)        not null, primary key
#  supplier_id :bigint(8)
#  skill_id    :bigint(8)
#  cost        :float
#

class Service < ApplicationRecord
  belongs_to :supplier
  belongs_to :skill
  has_many :orders

  validates :cost, :presence => true
end

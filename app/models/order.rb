# == Schema Information
#
# Table name: orders
#
#  id          :bigint(8)        not null, primary key
#  customer_id :bigint(8)
#  supplier_id :bigint(8)
#  service_id  :bigint(8)
#  datetime    :datetime
#  duration    :integer
#

class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :supplier
  belongs_to :service

  validates :datetime, :duration, :presence => true
end

# == Schema Information
#
# Table name: skills
#
#  id   :bigint(8)        not null, primary key
#  name :string
#

class Skill < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
end

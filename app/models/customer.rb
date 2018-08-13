# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  email           :string
#  name            :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#

class Customer < User

end

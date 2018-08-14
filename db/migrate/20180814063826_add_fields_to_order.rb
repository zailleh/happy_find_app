class AddFieldsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer_id, :bigint
    add_column :orders, :supplier_id, :bigint
    add_column :orders, :service_id, :bigint
    add_column :orders, :datetime, :datetime
    add_column :orders, :duration, :int
  end
end

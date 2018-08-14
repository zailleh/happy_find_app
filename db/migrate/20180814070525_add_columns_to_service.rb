class AddColumnsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :supplier_id, :bigint
    add_column :services, :skill_id, :bigint
    add_column :services, :cost, :float
  end
end

class AddPinIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pin_id, :integer
  end
end

class AddUrldataToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :urldata, :text
  end
end

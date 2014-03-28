class AddStreetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street, :text
  end
end

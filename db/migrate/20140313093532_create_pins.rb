class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.text :description
      t.integer :daily
      t.integer :weekly
      t.integer :monthly

      t.timestamps
    end
  end
end

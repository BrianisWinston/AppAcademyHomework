class Person < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |tab|
      tab.string :name, null: false
      tab.integer :house_id, null: false
      tab.timestamps
    end
  end
end

class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :foods, :user_id
    add_foreign_key :foods, :users, column: :user_id
  end
end

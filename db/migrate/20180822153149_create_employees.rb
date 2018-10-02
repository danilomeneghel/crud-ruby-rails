class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :role
      t.boolean :active

      t.timestamps
    end
  end
end

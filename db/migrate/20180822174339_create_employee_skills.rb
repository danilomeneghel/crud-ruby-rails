class CreateEmployeeSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_skills do |t|
      t.references :employee, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end

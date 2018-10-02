class AddSectorToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :sector, foreign_key: true
  end
end

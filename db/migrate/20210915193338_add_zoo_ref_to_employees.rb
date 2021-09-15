class AddZooRefToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :zoo, foreign_key: true
  end
end

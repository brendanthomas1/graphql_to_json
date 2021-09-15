class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.references :animal_type
      t.references :zoo
      t.integer :weight

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,         null: false
      t.integer :prefecture_id,   null: false
      t.string :city,             null: false
      t.string :address1,         null: false
      t.string :address2
      t.string :telephone,        null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end

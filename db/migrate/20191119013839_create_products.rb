class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :barcode
      t.string :name
      t.text :ingredients
      t.string :label_photo
      t.text :label_text
      t.string :front_photo

      t.timestamps
    end
  end
end

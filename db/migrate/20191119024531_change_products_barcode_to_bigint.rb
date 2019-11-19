class ChangeProductsBarcodeToBigint < ActiveRecord::Migration[5.2]
    def change
      change_column :products, :barcode, :bigint
    end
end

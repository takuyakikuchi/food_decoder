class CreateRestrictionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :restriction_tags do |t|
      t.references :product, foreign_key: true
      t.references :restriction, foreign_key: true

      t.timestamps
    end
  end
end

class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :detail
      t.float :score
      t.integer :price
      t.string :photo
      t.references :region, foreign_key: true
      t.references :purveyor, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

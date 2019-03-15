class CreateInfoWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :info_weddings do |t|
      t.text :description
      t.datetime :civil_date
      t.datetime :religious_date
      t.string :church_address
      t.string :location_address
      t.text :note1
      t.text :note2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

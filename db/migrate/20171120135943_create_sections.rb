class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :start_age
      t.integer :end_age

      t.timestamps
    end
  end
end

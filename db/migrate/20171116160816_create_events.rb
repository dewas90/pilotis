class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :admin, foreign_key: true
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end

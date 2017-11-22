class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.references :profile, foreign_key: true
      t.references :section, foreign_key: true
      t.string :status, :default => "Pending"
      t.date :birthday

      t.timestamps
    end
  end
end

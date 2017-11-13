class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :totem
      t.string :birth_date
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :phone_number
      t.string :photo
      t.string :gender
      t.string :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

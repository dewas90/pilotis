class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.references :admin, foreign_key: true
      t.references :profile, foreign_key: true
      t.date :date
      t.integer :amount
      t.string :title
      t.string :bank_account
      t.string :status

      t.timestamps
    end
  end
end

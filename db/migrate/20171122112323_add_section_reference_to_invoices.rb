class AddSectionReferenceToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :section, foreign_key: true
  end
end

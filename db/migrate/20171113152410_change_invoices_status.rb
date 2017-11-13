class ChangeInvoicesStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :invoices, :status, :string, :default => "unpaid"
  end
end

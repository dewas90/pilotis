class AddStatusToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :status, :string, :default => "Pending"
  end
end

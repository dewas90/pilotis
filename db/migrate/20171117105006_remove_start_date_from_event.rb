class RemoveStartDateFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :start_date
  end
end

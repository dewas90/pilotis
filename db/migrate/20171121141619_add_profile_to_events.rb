class AddProfileToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :profile, foreign_key: true
  end
end

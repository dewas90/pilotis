class AddInfoToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :admin, foreign_key: true
    add_reference :messages, :profile, foreign_key: true
  end
end

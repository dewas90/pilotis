class AddSectionToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :section, foreign_key: true
  end
end

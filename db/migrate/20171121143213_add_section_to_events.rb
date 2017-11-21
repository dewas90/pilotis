class AddSectionToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :section, foreign_key: true
  end
end

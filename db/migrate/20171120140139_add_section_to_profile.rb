class AddSectionToProfile < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :section, foreign_key: true
  end
end

class AddYearToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :year, :string
  end
end

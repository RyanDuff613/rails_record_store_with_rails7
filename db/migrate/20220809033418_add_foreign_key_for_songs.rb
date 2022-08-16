class AddForeignKeyForSongs < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :songs, :albums
  end
end

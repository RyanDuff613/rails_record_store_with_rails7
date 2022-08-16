class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.column(:name, :string)
      t.column(:year, :integer)
      
      t.timestamps
    end
  end
end

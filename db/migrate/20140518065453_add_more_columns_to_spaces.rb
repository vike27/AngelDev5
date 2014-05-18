class AddMoreColumnsToSpaces < ActiveRecord::Migration
  def change
  	add_column :spaces, :latitude, :float
  	add_column :spaces, :longitude, :float
  	add_column :spaces, :address, :string
  end
end

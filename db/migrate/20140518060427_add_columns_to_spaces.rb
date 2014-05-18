class AddColumnsToSpaces < ActiveRecord::Migration
  def change
  	add_column :spaces, :name, :text
  	add_column :spaces, :description, :text
  end
end

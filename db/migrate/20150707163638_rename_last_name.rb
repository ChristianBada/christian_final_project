class RenameLastName < ActiveRecord::Migration
  def change
  	rename_column :discussions, :last_name, :name
  end
end

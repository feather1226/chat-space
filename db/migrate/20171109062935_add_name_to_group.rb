class AddNameToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :group, :name, :string, null:false
  end
end

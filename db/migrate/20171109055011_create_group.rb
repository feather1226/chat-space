class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :group do |t|

      t.timestamps
    end
  end
end

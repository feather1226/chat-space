class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :image
      t.text :body
      t.references :user, foreign_key: true, null: false
      t.timestamps
      t.references :group, foreign_key: true, null: false
    end
  end
end

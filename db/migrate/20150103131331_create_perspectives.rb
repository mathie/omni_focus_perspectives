class CreatePerspectives < ActiveRecord::Migration
  def change
    create_table :perspectives do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end

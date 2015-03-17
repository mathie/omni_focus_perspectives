class InboxPerspective < ActiveRecord::Migration
  def change
    Perspective.delete_all

    change_table :perspectives do |t|
      t.string :type, null: false
      t.integer :show_items, default: 1
    end
  end
end

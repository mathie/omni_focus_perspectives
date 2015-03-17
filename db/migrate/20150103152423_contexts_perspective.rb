class ContextsPerspective < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.integer :sort_items_by
    end
  end
end

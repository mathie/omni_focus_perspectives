class CustomContextsPerspective < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.integer :group_items_by
      t.integer :filter_contexts
    end
  end
end

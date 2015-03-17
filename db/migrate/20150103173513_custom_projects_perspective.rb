class CustomProjectsPerspective < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.integer :group_projects_by
      t.boolean :open_in_a_new_window, null: false, default: false
      t.integer :filter_by_status
      t.integer :filter_by_availability
      t.integer :filter_by_duration
      t.integer :filter_projects
      t.string  :find_text
    end
  end
end

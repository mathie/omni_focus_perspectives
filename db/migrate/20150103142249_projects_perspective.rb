class ProjectsPerspective < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.boolean :show_folders_in_outline, null: false, default: false
    end
  end
end

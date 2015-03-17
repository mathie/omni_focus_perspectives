class PerspectivesShownInSidebar < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.boolean :shown_in_sidebar, null: false, default: false
    end
  end
end

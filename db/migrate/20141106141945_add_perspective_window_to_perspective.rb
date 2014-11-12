class AddPerspectiveWindowToPerspective < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.string :perspective_window_url
    end
  end
end

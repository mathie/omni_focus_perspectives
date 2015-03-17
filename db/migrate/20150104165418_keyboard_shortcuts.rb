class KeyboardShortcuts < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.boolean :modifier_shift, null: false, default: false
      t.boolean :modifier_ctrl, null: false, default: false
      t.boolean :modifier_alt, null: false, default: false
      t.boolean :modifier_cmd, null: false, default: false
      t.string :shortcut
    end
  end
end

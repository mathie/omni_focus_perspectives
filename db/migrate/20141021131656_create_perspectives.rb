# Create a basic set of initial data for perspectives. This is intended to be
# the common data shared between both project and non-project hierarchy-based
# perspectives.
class CreatePerspectives < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :perspectives, id: :uuid do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :sidebar, null: false, default: false

      t.timestamps null: false
    end
  end
end

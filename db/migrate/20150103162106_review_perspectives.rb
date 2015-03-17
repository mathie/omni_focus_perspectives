class ReviewPerspectives < ActiveRecord::Migration
  def change
    change_table :perspectives do |t|
      t.integer :show_projects
      t.integer :sort_projects_by
    end
  end
end

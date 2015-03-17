class ProjectsPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [ :show_items, :show_folders_in_outline ]
  end
end

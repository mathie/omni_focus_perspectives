class ReviewPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [ :show_projects, :show_items, :sort_projects_by ]
  end
end

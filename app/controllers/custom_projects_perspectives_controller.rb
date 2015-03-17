class CustomProjectsPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [
      :open_in_a_new_window,
      :group_projects_by,
      :sort_projects_by,
      :filter_by_status,
      :filter_by_availability,
      :filter_by_duration,
      :filter_projects,
      :find_text
    ]
  end
end
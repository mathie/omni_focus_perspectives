class CustomContextsPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [
      :open_in_a_new_window,
      :group_items_by,
      :sort_items_by,
      :filter_by_status,
      :filter_by_availability,
      :filter_by_duration,
      :filter_contexts,
      :find_text
    ]
  end
end
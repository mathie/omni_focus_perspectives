class FlaggedPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [ :show_items, :sort_items_by ]
  end
end

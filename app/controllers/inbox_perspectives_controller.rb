class InboxPerspectivesController < PerspectivesController
  private

  def perspective_fields
    super << [ :show_items ]
  end
end

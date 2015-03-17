class ReviewPerspective < BuiltInPerspective
  enum show_projects: [
    :active_projects,
    :remaining_projects,
  ]

  enum show_items: [
    :remaining_items,
    :all_items
  ]

  enum sort_projects_by: [
    :sort_projects_by_review_date,
    :sort_projects_by_unsorted
  ]

  validates :show_projects, presence: true
  validates :show_items, presence: true
  validates :sort_projects_by, presence: true
end
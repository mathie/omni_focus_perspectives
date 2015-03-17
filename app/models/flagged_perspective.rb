class FlaggedPerspective < BuiltInPerspective
  enum show_items: [
    :first_available_item,
    :available_items,
    :remaining_items,
    :all_items
  ]

  enum sort_items_by: [
    :sort_items_by_due_date,
    :sort_items_by_project
  ]

  validates :show_items, presence: true
  validates :sort_items_by, presence: true
end
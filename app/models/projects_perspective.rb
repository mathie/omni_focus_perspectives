class ProjectsPerspective < BuiltInPerspective
  enum show_items: [
    :first_available_item,
    :available_items,
    :remaining_items,
    :all_items
  ]

  validates :show_items, presence: true
end

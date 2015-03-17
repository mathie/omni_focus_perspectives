class CustomContextsPerspective < Perspective
  enum group_items_by: [
    :group_items_by_ungrouped,
    :group_items_by_context,
    :group_items_by_project,
    :group_items_by_due,
    :group_items_by_defer_date,
    :group_items_by_completed,
    :group_items_by_added,
    :group_items_by_changed,
    :group_items_by_flagged
  ]

  enum sort_items_by: [
    :sort_items_by_project,
    :sort_items_by_context,
    :sort_items_by_flagged,
    :sort_items_by_name,
    :sort_items_by_due,
    :sort_items_by_defer_date,
    :sort_items_by_added,
    :sort_items_by_changed,
    :sort_items_by_completed,
    :sort_items_by_duration
  ]

  enum filter_by_status: [
    :filter_by_status_any_status,
    :filter_by_status_flagged,
    :filter_by_status_unflagged,
    :filter_by_status_due_soon,
    :filter_by_status_due_or_flagged,
    :filter_by_status_due_and_flagged,
    :filter_by_status_due_and_unflagged
  ]

  enum filter_by_availability: [
    :filter_by_availability_first_available,
    :filter_by_availability_available,
    :filter_by_availability_remaining,
    :filter_by_availability_all,
    :filter_by_availability_completed
  ]

  enum filter_by_duration: [
    :any_duration,
    :five_minutes,
    :fifteen_minutes,
    :thiry_minutes,
    :one_hour,
    :more_than_one_hour,
    :unestimated
  ]

  enum filter_contexts: [
    :all_contexts,
    :remaining_contexts,
    :active_contexts,
    :stalled_contexts,
    :on_hold_contexts,
    :dropped_contexts
  ]

  validates :group_items_by, presence: true
  validates :sort_items_by, presence: true
  validates :filter_by_status, presence: true
  validates :filter_by_availability, presence: true
  validates :filter_by_duration, presence: true
  validates :filter_contexts, presence: true
end

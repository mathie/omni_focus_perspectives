class CustomProjectsPerspective < Perspective
  enum group_projects_by: [
    :group_projects_by_ungrouped,
    :group_projects_by_folder,
    :group_projects_by_due,
    :group_projects_by_defer_date,
    :group_projects_by_completed,
    :group_projects_by_next_review,
    :group_projects_by_added,
    :group_projects_by_changed
  ]

  enum sort_projects_by: [
    :sort_projects_by_unsorted,
    :sort_projects_by_name,
    :sort_projects_by_flagged,
    :sort_projects_by_due,
    :sort_projects_by_defer_date,
    :sort_projects_by_completed,
    :sort_projects_by_next_review,
    :sort_projects_by_added,
    :sort_projects_by_changed,
    :sort_projects_by_duration
  ]

  enum filter_by_status: [
    :filter_by_status_flagged,
    :filter_by_status_unflagged
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

  enum filter_projects: [
    :all_projects,
    :remaining_projects,
    :active_projects,
    :stalled_projects,
    :on_hold_projects,
    :completed_projects,
    :pending_projects,
    :dropped_projects
  ]

  validates :group_projects_by, presence: true
  validates :sort_projects_by, presence: true
  validates :filter_by_status, presence: true
  validates :filter_by_availability, presence: true
  validates :filter_by_duration, presence: true
  validates :filter_projects, presence: true
end

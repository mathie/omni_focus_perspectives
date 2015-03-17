class Perspective < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  def read_only_name?
    false
  end
end

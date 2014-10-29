class Perspective < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { maximum: 100, allow_blank: true }
end

# An OmniFocus perspective, or at least the common data and behaviour shared
# between project- and context-based perspectives.
class Perspective < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { maximum: 100, allow_blank: true }

  attr_accessor :perspective_type
end

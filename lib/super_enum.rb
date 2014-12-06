# Enhance the ActiveRecord default +enum+ behaviour so that it's less likely to
# have conflicting names for enum values.
module SuperEnum
  extend ActiveSupport::Concern

  module ClassMethods
    def super_enum(attributes)
      attributes.each do |key, values|
        enum key => values.map { |value| "#{key}_#{value}" }
      end
    end
  end
end

class BuiltInPerspective < Perspective
  after_initialize do
    self.name = self.class.name.sub(/Perspective$/, '').humanize
  end

  def read_only_name?
    true
  end
end

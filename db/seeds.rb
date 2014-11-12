Perspective.transaction do
  Perspective.delete_all

  Perspective.create!(
    title: 'Today',
    description: <<-MARKDOWN
This is my today perspective. There are many like it, but this one is *mine*.
    MARKDOWN
  )
end

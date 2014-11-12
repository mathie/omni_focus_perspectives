begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
rescue LoadError
  puts 'Warning: could not load Rubocop tasks.'
end

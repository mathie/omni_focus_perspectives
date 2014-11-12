# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# Replace the default documentation generation with YARD goodness. Sadly this
# must be done after the initial documentation tasks are registered so we can
# clear them.
begin
  require 'yard'
  require 'yard/rake/yardoc_task'

  Rake::Task['doc:app'].clear

  namespace :doc do
    YARD::Rake::YardocTask.new :app
  end
rescue LoadError => e
  puts "Warning: not adding Yardoc rake task: #{e.message}"
end

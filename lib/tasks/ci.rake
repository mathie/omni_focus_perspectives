task ci: [:default, :rubocop, 'doc:app', 'assets:precompile', 'assets:clean']

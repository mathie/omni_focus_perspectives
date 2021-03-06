notification :gntp, host: '127.0.0.1'

guard :bundler do
  watch('Gemfile')
end

guard :rspec, cmd: 'bin/rspec' do
  watch(%r{^spec/.+_spec\.rb$})

  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }

  watch(%r{^spec/support/(.+)\.rb$})      { "spec" }
  watch(%r{spec/(spec|rails)_helper.rb})  { "spec" }

  watch(%r{^app/controllers/(.+)_controller\.rb$}) { |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/controllers/#{m[1]}_controller_spec.rb",
      "spec/features/#{m[1]}_spec.rb"
    ]
  }

  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :yard do
  watch(%r{^(app|lib)/.+\.rb$})
  watch('README.md')
  watch('.yardopts')
end

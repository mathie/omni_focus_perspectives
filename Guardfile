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
      "spec/acceptance/#{m[1]}_spec.rb"
    ]
  }

  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
end


desc 'Run both test and style checker'
task all: [:test, :style]

desc 'Test (default behaviour)'
task default: :test

desc 'Rspec gem used for testing'
task :test do
  command = 'rspec --format doc --color spec/core_spec.rb'
  sh command
end

desc 'Rubocop for style hints'
task :style do
  sh 'rubocop'
end

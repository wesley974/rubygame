load_paths = FileList['spec', 'lib']
ruby_args = load_paths.pathmap('-I%p')

task all: [:test, :style]
task default: :test

task :test do
  require 'minitest'
  command = "ruby #{ruby_args} -rminitest/autorun spec/core_spec.rb"
  sh command
end

task :style do
  sh 'rubocop'
end

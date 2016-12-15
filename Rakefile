require 'minitest/autorun'
load_paths = FileList['spec', 'lib']
ruby_args = load_paths.pathmap('-I%p')

task default: %w(test)

task :test do
  command = "ruby #{ruby_args} -rminitest/autorun spec/core_spec.rb && rubocop"
  exec command
end
task :style do
  exec 'rubocop'
end

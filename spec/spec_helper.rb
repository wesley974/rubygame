%w(lib spec).each do |path|
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', path))
end

require 'core'
require 'user_interface'

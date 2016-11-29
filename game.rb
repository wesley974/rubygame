#!/usr/bin/env ruby
APP_ROOT = File.dirname(__FILE__)

# Learning : $LOAD_PATH = $:
$LOAD_PATH.unshift(File.join(APP_ROOT.to_s, 'lib'))

require 'user_interface'

player = UserInterface.new

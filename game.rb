#!/usr/bin/env ruby
APP_ROOT = File.dirname(__FILE__)

require "#{APP_ROOT}/lib/core"

player = Core.new
player.play

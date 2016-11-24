#!/usr/bin/env ruby
APP_ROOT = File.dirname(__FILE__)

# Learning : $LOAD_PATH = $:
$LOAD_PATH.unshift(File.join(APP_ROOT.to_s, 'lib'))

require 'core'

player = Core.new
player.play

# Codebeat score : 56,13

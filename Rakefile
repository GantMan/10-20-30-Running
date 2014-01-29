# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'motion-cocoapods'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = '10-20-30 Running'
  app.frameworks += %w(AVFoundation)
  app.pods do
    pod 'FBDigitalFont', :git => 'https://github.com/lyokato/FBDigitalFont.git'
  end
end

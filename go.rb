#!/usr/bin/env ruby
$:.unshift '.' 
require 'launcher'

# Script to invoke launcher using command-line args
def help
  print "You must pass in the path to the file to launch.Usage: #{__FILE__} target_file"
end


unless ARGV.size > 0
  help
  exit
else
  app_map = {
     'html' => 'chromium-browser -new-window  --enable-plugins    --allow-outdated-plugins ',
     'txt' => 'gedit',
     'jpg' => 'gimp'
  }

  l = Launcher.new app_map 
  target = ARGV.join ' ' 
  l.run target 
end
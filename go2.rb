#!/usr/bin/env ruby

$:.unshift '.'

require 'launcher2x'

# Script to invoke launcher using command-line args

app_map = {
     'html' => 'chromium-browser -new-window  --enable-plugins    --allow-outdated-plugins ',
     'txt' => 'gedit',
     'jpg' => 'gimp'
}

l = Launcher.new app_map

def help
  print <<-END_HELP
  You must pass in the path to the file to launch.

  Usage: #{__FILE__} target_file

  END_HELP

end

unless ARGV.size > 0
  help
  exit
else
  file = ARGV.shift 
  l.run file, ARGV 
end
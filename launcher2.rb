#!/usr/bin/env ruby
#

# Example application to demonstrate some basic Ruby features
# Version 2x: read arguments
$:.unshift '.'

require 'launcher'

class Launcher

  def handler file 
    get_handler(file) || build_handler(file)
  end

  def build_handler file 
    handler = Class.new 
    application = select_app file
    eval "def handler.run file,  args=nil
   system '#{application} \#{file} \#{args}'  
  end"
    handler
  end

  def get_handler file
    begin
      here = File.expand_path( File.dirname __FILE__ )
      ftype = file_type file
      require "#{here}/handlers/#{ftype }"
      Object.const_get( ftype.capitalize ).new
    rescue Exception
      warn $!.inspect
      nil
    end
  end

  # Execute the given file using he associate app
  def run file, args = nil 
    handler(file).run file, args
  end

end


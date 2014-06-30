#!/usr/bin/env ruby

# version 0

class Launcher
  # Create an instance of this class with the file-type -> app
  # mapping hash
	def initialize app_map 
		@app_map = app_map
	end

	# Execute the given file using he associate app
	def run file_name 
		application = select_app file_name 
		system "#{application} #{file_name}"  
	end

	# Given a file, look up the matcing application
	def select_app file_name 
		ftype = file_type( file_name ).downcase
		@app_map[ ftype ]
	end

	# Return the part of the file name string after the last '.'
	def file_type file_name 
		File.extname( file_name ).gsub /^\./, '' 
	end
end

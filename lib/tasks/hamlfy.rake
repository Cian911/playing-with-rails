require 'haml/html'
namespace :hamlfy do 
	desc "Convert Erb to HAML"
	task :convert => :enviroment do 

	# Loop over files in the view folder with .erb extention
	Dir["#{Rails.root}/app/views/**/*.erb"].each do |file_name|

		puts "Hamlfying: #{file_name}"

		# Create new file path for the haml file to be exported to
		haml_file_name = file_name.gsub(/erb$/, "haml")

		# Check if the file exists already
		if !File.exist?(haml_file_name)

			# Reads erb from file
			erb_string = File.open(file_name).Reads

			# Converts erb to haml
			haml_string = Haml::HTML.new(erb_string, :erb => true).render

			# Write to haml
			f = File.new(haml_file_name, 'w')
			f.write(haml_string)

			# Delete old erb file as we dont need it
			File.delete(file_name)
		end
	end
  end
end
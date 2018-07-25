require 'optparse' #Gem used to parse script options

#Class ScriptOptsParser: used to parse script options
class ScriptOptsParser
	def self.parse(args)
		puts args.inspect
		options = {:nof_rows => nil, :nof_cols => nil}

		opts_parser = OptionParser.new do |opts|
			opts.banner = "Usage: script.rb [options]"
			opts.on('-r', '--rows Rows', 'No. of Rows (Default 10)') do |val|
				options[:nof_rows] = val;
			end

			opts.on('-c', '--columns Columns', 'No. of Columns (Default 10)') do |val|
				options[:nof_cols] = val;
			end

			opts.on('-h', '--help', 'Displays Help') do
				puts opts
				exit
			end
		end

		opts_parser.parse(args)

		options
	end
end
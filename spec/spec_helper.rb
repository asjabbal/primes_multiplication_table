#all class files are required for testing
# ["lib", "util", "src"].each{|dir_name|
# 	Dir["../#{dir_name}/*"].each {|file|
# 		puts file.gsub(".rb", "")
# 		require_relative file.gsub(".rb", "") #with .rb it wasn't working
# 	}
# }

require_relative "../lib/prime"
require_relative "../lib/numbers_multiplication_table"
require_relative "../util/script_opts_parser"
require_relative "../src/primes_multiplication_table"

RSpec.configure do |config|
	# config.expect_with(:rspec) { |c| c.syntax = :should }
end
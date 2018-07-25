#require library files
require_relative "../lib/prime"
require_relative "../lib/numbers_multiplication_table"

#Class PrimesMultiplicationTable: inherits NumbersMultiplicationTable and used to print primes multiplication table based on the given rows and columns count and default count is 10
class PrimesMultiplicationTable < NumbersMultiplicationTable
	DEFAULT_COUNT = 10

	def initialize(rows_count=DEFAULT_COUNT, cols_count=DEFAULT_COUNT)
		rows_count = rows_count.nil? ? DEFAULT_COUNT : rows_count.to_i
		cols_count = cols_count.nil? ? DEFAULT_COUNT : cols_count.to_i
		super("Prime\nNumbers", Prime.fetch(rows_count), Prime.fetch(cols_count))
	end

	def generate_data
		super
	end

	def print
		super
	end
end
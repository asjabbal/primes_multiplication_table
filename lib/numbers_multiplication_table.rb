require 'terminal-table' #Gem used to print ASCII Table

#Class NumbersMultiplicationTable: generic class to print multiplication table for any set of numbers
class NumbersMultiplicationTable
	attr_reader :vertical_numbers, :horizontal_numbers, :name
	attr_accessor :table_data

	private :vertical_numbers, :horizontal_numbers, :name, :table_data

	def initialize(table_name="", nums_arr_1=[], nums_arr_2=[])
		@name = table_name.to_s
		@vertical_numbers = nums_arr_1
		@horizontal_numbers = nums_arr_2
		@table_data = []
	end
	
	def generate_data
		return self if table_data.size > 0

		table_data << ([name] + horizontal_numbers) << :separator

		for i in 0..vertical_numbers.length-1 do
			row = [vertical_numbers[i]]
			for j in 0..horizontal_numbers.length-1 do
				row << vertical_numbers[i] * horizontal_numbers[j]
			end

			table_data << row
		end

		self
	end

	def print
		puts Terminal::Table.new(:rows => table_data)
	end
end
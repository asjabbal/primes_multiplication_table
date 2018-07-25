require 'spec_helper'
 
describe PrimesMultiplicationTable do

	let(:rows_count) { 10 }
	let(:cols_count) { 10 }
	subject(:table) { described_class.new(rows_count, cols_count) }

	before do
		allow_any_instance_of(PrimesMultiplicationTable).to receive(:row_numbers).and_return(table.send(:vertical_numbers))
		allow_any_instance_of(PrimesMultiplicationTable).to receive(:col_numbers).and_return(table.send(:horizontal_numbers))
		allow_any_instance_of(PrimesMultiplicationTable).to receive(:data).and_return(table.send(:table_data))
	end

	it "should have parent class NumbersMultiplicationTable" do
		expect(described_class.superclass).to eq(NumbersMultiplicationTable)
	end

	it "should have default rows and columns count 10" do
		expect(described_class.const_get("DEFAULT_COUNT")).to eq(10)
	end

	describe "#initialize" do
		it "should have correct rows and columns count" do
			expect(table.row_numbers.size).to eq(rows_count)
			expect(table.col_numbers.size).to eq(cols_count)
		end

		it "should have correct rows and columns numbers" do
			expect(table.row_numbers).to eq(Prime.fetch(rows_count))
			expect(table.col_numbers).to eq(Prime.fetch(cols_count))
		end

		it "should have empty table data" do
			expect(table.data.size).to eq(0)
		end
	end

	describe "#generate_data" do

		it "should generate table data" do
			table.generate_data()
			expect(table.data.size).to be > 0
		end

		it "should return self" do
			expect(table.generate_data()).to eq(table)
		end
	end

	describe "#print" do
		it "should call Terminal::Table class to print table and print empty table if generate_data is not called before" do
			expect(Terminal::Table).to receive(:new).once.with(:rows => table.data)
			table.print()
		end

		it "should print a table if called after generate_data" do
			table.generate_data().print()
		end
	end
end
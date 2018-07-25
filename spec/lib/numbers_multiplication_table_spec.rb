require 'spec_helper'
 
describe NumbersMultiplicationTable do

	let(:rows_count) { 10 }
	let(:cols_count) { 10 }
	subject(:table) { described_class.new("Table", Prime.fetch(rows_count), Prime.fetch(cols_count)) }

	before do
		allow_any_instance_of(NumbersMultiplicationTable).to receive(:row_numbers).and_return(table.send(:vertical_numbers))
		allow_any_instance_of(NumbersMultiplicationTable).to receive(:col_numbers).and_return(table.send(:horizontal_numbers))
		allow_any_instance_of(NumbersMultiplicationTable).to receive(:data).and_return(table.send(:table_data))
		allow_any_instance_of(NumbersMultiplicationTable).to receive(:title).and_return(table.send(:name))
	end

	it "should have following attributes" do
		expect(NumbersMultiplicationTable.private_instance_methods).to include(:name, :vertical_numbers, :horizontal_numbers, :table_data)
	end

	describe "#intialize" do
		it "should intialize with correct values" do
			expect(table.row_numbers).to eq(Prime.fetch(rows_count))
			expect(table.col_numbers).to eq(Prime.fetch(cols_count))
			expect(table.data).to eq([])
			expect(table.title).to eq("Table")
		end

		it "should have correct rows and columns count" do
			expect(table.row_numbers.size).to eq(rows_count)
			expect(table.col_numbers.size).to eq(cols_count)
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
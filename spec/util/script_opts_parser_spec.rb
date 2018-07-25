require 'spec_helper'
 
describe ScriptOptsParser do

	describe "#parse" do
		it "should return options with nil value if empty ARGV is passed" do
			expect(described_class.parse([])).to eq({:nof_rows => nil, :nof_cols => nil})
		end

		it "should return options with correct values if non-empty ARGV is passed" do
			expect(described_class.parse(%w(-r 10 -c 20))).to eq({:nof_rows => "10", :nof_cols => "20"})
		end
	end

end
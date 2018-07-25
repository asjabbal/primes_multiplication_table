require 'spec_helper'
 
describe Prime do
	let(:first_ten_primes) { Prime.fetch(10) }

	it "should have default size 10" do
		expect(described_class.const_get("DEFAULT_SIZE")).to eq(10)
	end

	describe "#fetch" do
		it "should return first ten primes if no argument is passed" do
			expect(described_class.fetch()).to eq(first_ten_primes)
		end

		it "should return first ten primes if nil argument is passed" do
			expect(described_class.fetch(nil)).to eq(first_ten_primes)
		end

		it "should return first ten primes if 10 is passed" do
			expect(described_class.fetch(10)).to eq(first_ten_primes)
		end

		it "should return empty array if 0 is passed" do
			expect(described_class.fetch(0)).to eq([])
		end

		it "should call generate method" do
			expect(described_class).to receive(:generate).with(12)
			described_class.fetch(12)
		end
	end

	describe "#generate" do
		it "should return first ten primes if 10 is passed" do
			expect(described_class.send(:generate, 10)).to eq(first_ten_primes)
		end

		it "should return empty array if 0 is passed" do
			expect(described_class.send(:generate, 0)).to eq([])
		end
	end

	describe "#is_prime?" do
		it "should return true if prime number is passed" do
			expect(described_class.send(:is_prime?, first_ten_primes.sample)).to eq(true)
		end

		it "should return false if non-prime number is passed" do
			expect(described_class.send(:is_prime?, 4)).to eq(false)
		end
	end
end
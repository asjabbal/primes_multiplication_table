#Class Prime: to calculate first N prime numbers
class Prime
	DEFAULT_SIZE = 10

	def self.fetch(n=DEFAULT_SIZE)
		n = n.nil? ? DEFAULT_SIZE : n.to_i
		primes = generate(n)
		primes
	end

	private
	def self.generate(size)
		primes = []
		n = 0
		num = 2

		while n < size
			is_num_prime = is_prime?(num)

			if is_num_prime
				primes << num
				n += 1
			end

			num += 1
		end

		primes
	end

	def self.is_prime?(num)
		is_num_prime = true
		for i in 2..num-1 do
			if (num % i) == 0
				is_num_prime = false
				break
			end
		end

		is_num_prime
	end
end
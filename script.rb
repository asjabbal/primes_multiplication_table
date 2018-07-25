require_relative "./src/primes_multiplication_table"
require_relative "./util/script_opts_parser"

parsed_opts = ScriptOptsParser.parse(ARGV)

table = PrimesMultiplicationTable.new(parsed_opts[:nof_rows], parsed_opts[:nof_cols])
table.generate_data().print()
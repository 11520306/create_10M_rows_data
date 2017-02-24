require 'csv'

# Create query file from ./10M_rows_data.csv data file.
# Run this by cmd: $cd /path/to/create_data
# then $ruby create_query_file.rb
def create_query_file(number_queries)
  csv_rows = CSV.read('./10M_rows_data.csv')
  File.open("../benchmark/benchmark_query_#{number_queries}_rows.sql", 'a+') do |query_file|
    csv_rows.each_with_index do |row, index|
      break if index > number_queries
      query_file.write("select * from test_data where random_str = '#{row[1]}';")
    end
  end
  puts "create_query_file with #{number_queries} rows done"
end

puts 'Input the number queries you want to create: (not over 10_000_000)'
puts 'Eg: 100 or 1000 or 10_000 or 1_000_000'

number_queries = gets.chomp.to_i
create_query_file(number_queries)

# Run # Run this by cmd: $cd /path/to/create_data
# then $ruby create_10M_rows_data.rb
# to create 10M rows data into csv file

require 'csv'

$arr_chars = ('a'..'z').to_a.freeze

def random_str(str_length)
  (0...str_length).map { $arr_chars.to_a[rand(26)] }.join
end

# number_rows >= number_query
# 1 <= str_length <= 255
def create_rows_and_query(number_rows, number_query, str_length)
  File.open("../benchmark/benchmark_#{number_query}_queries.sql", 'a+') do |file|
    CSV.open("./#{number_rows}_rows_data.csv", 'a+') do |csv|
      number_rows.times do |time|
        random_str1 = random_str(str_length)
        csv << [time + 1, random_str1]
        file.write("select * from test_data where random_str = '#{random_str1}';") if time < number_query
      end
    end
  end
  puts "CREATE #{number_rows} ROWS DONE"
end

create_rows_and_query(10_000_000, 20_000, 20)
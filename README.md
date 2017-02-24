# create_10M_rows_data
A simple tool to generate huge amount of data in csv format.<br/>
I create this tool for benchmarking [my other tool](https://github.com/manhdaovan/mysql_warmup).

## When?
* Need to generate a huge rows of data for benchmarking
* Need to generate many queries compatible with above data
* Keep it simple in CSV format to easy to import into mysql

## How?
* **[Require]** First time, you need to create 10M rows of data first by running:
```
$cd /path/to/create_data
$ruby create_10M_rows_data.rb
```
You will get 2 files: one for 10M rows of data and. Each row has format: [id(auto increment from 1), string(random with length 20)],
and other for 20k sample query, can be used for sample query when benchmark.

* ***[Optional]*** You can get more sample query by running:
```
$cd /path/to/create_data
$ruby create_query_file.rb
```
You will get a file that contains x sample queries(x by your input), can be used for sample query when benchmark.

* Import CSV file into mysql:
In mysql command line:
```
LOAD DATA INFILE '/path/to/create_data/10M_rows_data.csv' INTO TABLE table_name(field1, field2) FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
```

## Note
You can change the source code to fit with your requirement. 

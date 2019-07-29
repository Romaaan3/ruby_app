require_relative 'lib/log_parser'
require_relative 'lib/data_aggregator'

parser = LogParser.new(ARGV[0])
DataAggregator.new(parser).perform

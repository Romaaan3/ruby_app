require_relative 'reporter'
require_relative 'report_printer'

class DataAggregator
  attr_reader :file_parser, :report_printer_class

  def initialize(file_parser, report_printer_class = ReportPrinter)
    @file_parser = file_parser
    @report_printer_class = report_printer_class
  end

  def perform
    report_printer.print_views
    report_printer.print_uniq_views
  end

  private

  def report_printer
    @report_printer ||= report_printer_class.new(reporter)
  end

  def reporter
    @reporter ||= Reporter.new(file_parser.log_lines)
  end
end

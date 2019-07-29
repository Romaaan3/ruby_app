class ReportPrinter
  attr_reader :reporter

  def initialize(reporter)
    @reporter = reporter
  end

  def print_views
    puts 'Most views:'
    puts(reporter.most_views.map { |report_line| views_line(report_line) })
  end

  def print_uniq_views
    puts 'Most unique views:'
    puts(reporter.most_unique_views.map { |report_line| uniq_views_line(report_line) })
  end

  private

  def views_line(line)
    "#{line[:path]} #{line[:views_count]} visits"
  end

  def uniq_views_line(line)
    "#{line[:path]} #{line[:uniq_views_count]} unique views"
  end
end

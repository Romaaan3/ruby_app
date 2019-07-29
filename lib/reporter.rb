class Reporter
  attr_reader :log_lines

  def initialize(log_lines)
    @log_lines = log_lines
  end

  def most_views
    counted_views.sort_by { |report_line| report_line[:views_count] }.reverse
  end

  def most_unique_views
    counted_views.sort_by { |report_line| report_line[:uniq_views_count] }.reverse
  end

  def counted_views
    @counted_views ||= count_views
  end

  private

  def count_views
    log_lines.group_by { |line| line[:path] }.map do |path, log_lines|
      {
        views_count: log_lines.count,
        uniq_views_count: log_lines.map { |line| line[:ip] }.uniq.count,
        path: path
      }
    end
  end
end

class LogParser
  attr_reader :path_to_file

  def initialize(path_to_file)
    @path_to_file = path_to_file
  end

  def log_lines
    @log_lines ||= parse_log
  end

  private

  def parse_log
    file_lines.map { |line| parse_line(line) }
  end

  def file_lines
    File.read(path_to_file).lines
  end

  def parse_line(line)
    path, ip = line.strip.split(' ')
    { path: path, ip: ip }
  end
end

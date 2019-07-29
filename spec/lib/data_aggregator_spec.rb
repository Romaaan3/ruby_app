require_relative '../spec_helper'
require_relative '../../lib/data_aggregator'

RSpec.describe DataAggregator do
  let(:log_lines_stub) { 'test' }
  let(:parser) { double(log_lines: log_lines_stub) }
  let(:reporter) { double }
  let(:report_printer) { double }

  subject do
    described_class.new(parser).perform
  end

  describe '#perform' do
    it 'calls correct methods' do
      allow(Reporter).to receive(:new).and_return(reporter)
      allow(ReportPrinter).to receive(:new).and_return(report_printer)
      expect(report_printer).to receive(:print_views)
      expect(report_printer).to receive(:print_uniq_views)
      subject
    end
  end
end

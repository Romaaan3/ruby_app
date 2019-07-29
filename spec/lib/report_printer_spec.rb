require_relative '../spec_helper'
require_relative '../../lib/report_printer'

RSpec.describe ReportPrinter do
  let(:reporter) { double }

  subject { described_class.new(reporter) }

  let(:counted_lines) do
    [
      { views_count: 4, uniq_views_count: 3, path: '/help_page' },
      { views_count: 2, uniq_views_count: 1, path: '/index' }
    ]
  end

  before do
    allow(reporter).to receive(:most_views).and_return(counted_lines)
    allow(reporter).to receive(:most_unique_views).and_return(counted_lines)
  end

  describe '#print_views' do
    it 'prints correct content' do
      expect(STDOUT).to receive(:puts).with('Most views:')
      expect(STDOUT).to receive(:puts).with(['/help_page 4 visits', '/index 2 visits'])
      subject.print_views
    end
  end

  describe '#print_uniq_views' do
    it 'prints correct content' do
      expect(STDOUT).to receive(:puts).with('Most unique views:')
      expect(STDOUT).to receive(:puts).with(['/help_page 3 unique views', '/index 1 unique views'])
      subject.print_uniq_views
    end
  end
end

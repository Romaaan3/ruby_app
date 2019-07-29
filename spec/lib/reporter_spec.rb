require_relative '../spec_helper'
require_relative '../../lib/log_parser'
require_relative '../../lib/reporter'

RSpec.describe Reporter do
  let(:parsed_data) { LogParser.new('spec/fixtures/webserver.log').log_lines }

  subject do
    described_class.new(parsed_data)
  end

  describe '#counted_views' do
    let(:expected_results) do
      [{ views_count: 4, uniq_views_count: 4, path: '/contact' },
       { views_count: 2, uniq_views_count: 2, path: '/home' },
       { views_count: 1, uniq_views_count: 1, path: '/about/2' },
       { views_count: 4, uniq_views_count: 3, path: '/help_page/1' },
       { views_count: 1, uniq_views_count: 1, path: '/index' },
       { views_count: 5, uniq_views_count: 1, path: '/about' }]
    end

    it 'returns correct data' do
      expect(subject.counted_views).to eq(expected_results)
    end
  end

  describe '#most_views' do
    let(:expected_results) do
      [{ views_count: 5, uniq_views_count: 1, path: '/about' },
       { views_count: 4, uniq_views_count: 3, path: '/help_page/1' },
       { views_count: 4, uniq_views_count: 4, path: '/contact' },
       { views_count: 2, uniq_views_count: 2, path: '/home' },
       { views_count: 1, uniq_views_count: 1, path: '/index' },
       { views_count: 1, uniq_views_count: 1, path: '/about/2' }]
    end

    it 'sorts by views count' do
      expect(subject.most_views).to eq(expected_results)
    end
  end

  describe '#most_unique_views' do
    let(:expected_results) do
      [{ views_count: 4, uniq_views_count: 4, path: '/contact' },
       { views_count: 4, uniq_views_count: 3, path: '/help_page/1' },
       { views_count: 2, uniq_views_count: 2, path: '/home' },
       { views_count: 5, uniq_views_count: 1, path: '/about' },
       { views_count: 1, uniq_views_count: 1, path: '/index' },
       { views_count: 1, uniq_views_count: 1, path: '/about/2' }]
    end

    it 'sorts by uniq views count' do
      expect(subject.most_unique_views).to eq(expected_results)
    end
  end
end

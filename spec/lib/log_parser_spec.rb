require_relative '../spec_helper'
require_relative '../../lib/log_parser'

RSpec.describe LogParser do
  let(:path_to_file) { 'spec/fixtures/webserver.log' }
  subject do
    described_class.new(path_to_file)
  end

  describe '#log_lines' do
    let(:expected_result) do
      [{ path: '/help_page/1', ip: '126.318.035.038' },
       { path: '/contact', ip: '184.123.665.067' },
       { path: '/home', ip: '184.123.665.067' },
       { path: '/about/2', ip: '444.701.448.104' },
       { path: '/help_page/1', ip: '929.398.951.889' },
       { path: '/index', ip: '444.701.448.104' },
       { path: '/help_page/1', ip: '722.247.931.582' },
       { path: '/about', ip: '061.945.150.735' },
       { path: '/help_page/1', ip: '646.865.545.408' },
       { path: '/home', ip: '235.313.352.950' }]
    end

    it 'returns valid data' do
      expect(subject.log_lines).to eq(expected_result)
    end

    context 'file missing' do
      let(:path_to_file) { 'spec/fixtures/no_file.log' }

      it 'raises error' do
        expect { subject.log_lines }.to raise_error(FileMissingError, 'Cannot find file.')
      end
    end

    context 'invalid file format' do
      let(:path_to_file) { 'spec/fixtures/invalid_format.log' }

      it 'raises error' do
        expect { subject.log_lines }.to raise_error(InvalidFileFormatError, 'Invalid file format.')
      end
    end
  end
end

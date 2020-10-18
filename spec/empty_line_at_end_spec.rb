# spec/linter_spec.rb
require_relative '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage

describe Linter do
  describe '#empty_line_at_end?' do
    let(:test_case_error) { ['}'] }
    let(:test_case_no_error) { ['}', ''] }

    context '#empty_line_at_end? behaviour' do
      # rubocop:disable Layout/LineLength
      example 'return error string when there is no empty line at the end of the file' do
        expect(empty_line_at_end?(test_case_error, [])).to eq(['Expecting empty line at the end of the file, on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(empty_line_at_end?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

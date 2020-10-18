# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
  describe '#empty_line_after_block?' do
    let(:test_case_error) { ['}', '.class {'] }
    let(:test_case_no_error) { ['}', ''] }

    context '#empty_line_after_block? behaviour' do
      # rubocop:disable Layout/LineLength

      example 'return error string when there is no empty line after a closing block declaration line' do
        expect(empty_line_after_block?(test_case_error, [])).to eq(['Expecting empty line after block closure, on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(empty_line_after_block?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

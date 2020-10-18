# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage

describe Linter do
  describe '#block_declaration_single_line?' do
    let(:test_case_error) { ['.sing-up-btn, .bg-orange {'] }
    let(:test_case_no_error) { ['.sing-up-btn,', '.bg-orange {'] }

    context '#block_declaration_single_line? behaviour' do
      # rubocop:disable Layout/LineLength
      example 'return error string when more than one declaration is found on the same line' do
        expect(block_declaration_single_line?(test_case_error, [])).to eq(['More than one declaration in a single line, on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(block_declaration_single_line?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

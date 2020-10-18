# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage

describe Linter do
  describe '#block_declaration_end?' do
    let(:test_case_error) { ['padding: 0 .5rem;}'] }
    let(:test_case_no_error) { ['}'] }

    context '#block_declaration_end? behaviour' do
      # rubocop:disable Layout/LineLength

      example 'return error string when the closing bracket on the block is not in an empty line' do
        expect(block_declaration_end?(test_case_error, [])).to eq(['Closing bracket should be on an empty line, on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(block_declaration_end?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
  describe '#block_declaration_start?' do
    let(:test_case_error) { ['.bg-orange{'] }
    let(:test_case_no_error) { ['.bg-orange {'] }

    context '#block_declaration_start? behaviour' do
      example 'return error string when no space is detected before the block declaration {' do
        expect(block_declaration_start?(test_case_error, [])).to eq(['No space before opening block declaration on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(block_declaration_start?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

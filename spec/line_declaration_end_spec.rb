# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
  describe '#line_declaration_end?' do
    let(:test_case_error) { ['  padding: 0 .5rem'] }
    let(:test_case_no_error) { ['  padding: 0 .5rem;'] }

    context '#line_declaration_end? behaviour' do
      example 'return error string when line declaration does not end with a semi-colon' do
        expect(line_declaration_end?(test_case_error, [])).to eq(['Declaration should end with a semi-colon on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(line_declaration_end?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

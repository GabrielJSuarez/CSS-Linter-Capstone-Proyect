# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
include Linter

describe Linter do
  describe '#single_line_declaration?' do
    let(:test_case_error) { ['  padding:0 .5rem; padding: 0 .5rem;'] }
    let(:test_case_no_error) { ['  padding: 0 .5rem;', '  padding: 0 .5rem;'] }

    context '#single_line_declaration? behaviour' do
      example 'return error string when more than one declaration is found in a single line' do
        expect(single_line_declaration?(test_case_error, [])).to eq(['Declaration should be in a single line, on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(single_line_declaration?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

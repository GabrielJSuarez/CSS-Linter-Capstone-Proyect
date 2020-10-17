# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
include Linter

describe Linter do
    describe '#trailing_white space?' do
        let(:test_case_error) { ['  font-size: 62.5%; '] }
        let(:test_case_no_error) { ['  font-size: 62.5%;'] }

        context '#trailing_white space? behaviour' do
        example 'return error string when a white space is found' do
            expect(trailing_white_space?(test_case_error, [])).to eq(['trailing white space on line 1'])
        end

        example 'return empty array when no error is found' do
            expect(trailing_white_space?(test_case_no_error, [])).to eq([])
        end
        end
    end
end
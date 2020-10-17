# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
include Linter

describe Linter do
  describe '#empty_line_after_block?' do
    let(:test_case_error) { ['}', '.class {'] }
    let(:test_case_no_error) { ['}', ''] }

    context '#empty_line_after_block? behaviour' do
      example 'return error string when there is no empty line after a closing block declaration line' do
        expect(empty_line_after_block?(test_case_error, [])).to eq(['Expecting empty line after block closure, on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(empty_line_after_block?(test_case_no_error, [])).to eq([])
      end
    end
  end

  describe '#empty_line_at_end?' do
    let(:test_case_error) { ['}'] }
    let(:test_case_no_error) { ['}', ''] }

    context '#empty_line_at_end? behaviour' do
      example 'return error string when there is no empty line at the end of the file' do
        expect(empty_line_at_end?(test_case_error, [])).to eq(['Expecting empty line at the end of the file, on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(empty_line_at_end?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

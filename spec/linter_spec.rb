# frozen_string_literal: true

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
include Linter

describe Linter do
  describe '#space_after_colon?' do
    let(:test_case_error) { ['  padding:0 .5rem;'] }
    let(:test_case_no_error) { ['  padding: 0 .5rem;'] }

    context '#space_after_colon? behaviour' do
      example 'return error string when no space is following the colon declaration' do
        expect(space_after_colon?(test_case_error, [])).to eq(['Empty space expected after colon (:) in declaration on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(space_after_colon?(test_case_no_error, [])).to eq([])
      end
    end
  end

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

  describe '#comma_separated_values?' do
    let(:test_case_error) { ['  font-family: "Times New Roman",Times,serif;'] }
    let(:test_case_no_error) { ['  font-family: "Times New Roman", Times, serif;'] }

    context '#comma_separated_values? behaviour' do
      example 'return error string when there is no space after comma-separated values' do
        expect(comma_separated_values?(test_case_error, [])).to eq(['Expected space after comma separated values in declaration, on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(comma_separated_values?(test_case_no_error, [])).to eq([])
      end
    end
  end

  describe '#prefix_property_values?' do
    let(:test_case_error) { ['  opacity: 0.7;'] }
    let(:test_case_no_error) { ['  opacity: .7;'] }

    context '#prefix_property_values? behaviour' do
      example 'return error string when there is no space after comma-separated values' do
        expect(prefix_property_values?(test_case_error, [])).to eq(['Unexpected prefix float value on line 1'])
      end

      example 'return empty array when no error is found' do
        expect(prefix_property_values?(test_case_no_error, [])).to eq([])
      end
    end
  end

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

# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
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
end

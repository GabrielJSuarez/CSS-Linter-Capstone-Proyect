# spec/linter_spec.rb
require_relative '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
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
end

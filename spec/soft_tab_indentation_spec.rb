# spec/linter_spec.rb
require_relative '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
  describe '#soft_tab_indentation?' do
    let(:test_case_error) { ['    padding: 0 .5rem;'] }
    let(:test_case_no_error) { ['  padding: 0 .5rem;'] }

    context '#soft_tab_indentation? behaviour' do
      # rubocop:disable Layout/LineLength

      example 'return error string when the correct indentation is not found' do
        expect(soft_tab_indentation?(test_case_error, [])).to eq(['Expected indentation of two spaces in declaration on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(soft_tab_indentation?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

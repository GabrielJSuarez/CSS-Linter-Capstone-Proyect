# spec/linter_spec.rb
require '../lib/linter_suite.rb'
# rubocop:disable Style/MixinUsage
include Linter
# rubocop:enable Style/MixinUsage
describe Linter do
  describe '#space_after_colon?' do
    let(:test_case_error) { ['  padding:0 .5rem;'] }
    let(:test_case_no_error) { ['  padding: 0 .5rem;'] }

    context '#space_after_colon? behaviour' do
      # rubocop:disable Layout/LineLength

      example 'return error string when no space is following the colon declaration' do
        expect(space_after_colon?(test_case_error, [])).to eq(['Empty space expected after colon (:) in declaration on line 1'])
      end
      # rubocop:enable Layout/LineLength

      example 'return empty array when no error is found' do
        expect(space_after_colon?(test_case_no_error, [])).to eq([])
      end
    end
  end
end

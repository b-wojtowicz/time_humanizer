require 'spec_helper'

describe TimeHumanizer do
  subject { run }

  describe '.to_seconds' do
    let(:run) { described_class.to_seconds(value) }

    conversion_with value: nil, expects: nil
    conversion_with value: '0', expects: 0
    conversion_with value: '1', expects: 3600
    conversion_with value: '1h', expects: 3600
    conversion_with value: '1h30m', expects: 5400
    conversion_with value: '2m', expects: 120
    conversion_with value: '1h5m', expects: 3900
    conversion_with value: '1h06m', expects: 3960
    conversion_with value: '1h0m', expects: 3600
    conversion_with value: '', expects: nil
    conversion_with value: '  ', expects: nil
    conversion_with value: 'x', raises: TimeHumanizer::InvalidArgument
    conversion_with value: '  x', raises: TimeHumanizer::InvalidArgument
    conversion_with value: '0f', raises: TimeHumanizer::InvalidArgument
  end

  describe 'to_humanized_time' do
    let(:run) { described_class.to_humanized_time(value) }

    conversion_with value: nil, expects: nil
    conversion_with value: 0, expects: '0'
    conversion_with value: 3600, expects: '1h'
    conversion_with value: 5400, expects: '1h30m'
    conversion_with value: 120, expects: '2m'
    conversion_with value: 3900, expects: '1h5m'
    conversion_with value: 3960, expects: '1h6m'
    conversion_with value: '0', expects: '0'
    conversion_with value: '3600', expects: '1h'
    conversion_with value: '5400', expects: '1h30m'
    conversion_with value: '120', expects: '2m'
    conversion_with value: '3900', expects: '1h5m'
    conversion_with value: '3960', expects: '1h6m'
    conversion_with value: '', expects: nil
    conversion_with value: '  ', expects: nil
    conversion_with value: 'x', raises: TimeHumanizer::InvalidArgument
    conversion_with value: '  x', raises: TimeHumanizer::InvalidArgument
    conversion_with value: '0f', raises: TimeHumanizer::InvalidArgument
  end
end

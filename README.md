# TimeHumanizer

Formats seconds to readable time format i.e. 8h05m and vice versa. See examples below.

## Installation

Add this line to your application's Gemfile:

    gem 'time_humanizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_humanizer

## Usage

```ruby
TimeHumanizer.to_seconds(nil) # nil
TimeHumanizer.to_seconds('0') # 0
TimeHumanizer.to_seconds('1') # 3600
TimeHumanizer.to_seconds('1h') # 3600
TimeHumanizer.to_seconds('1h30m') # 5400
TimeHumanizer.to_seconds('2m') # 120
TimeHumanizer.to_seconds('1h5m') # 3900
TimeHumanizer.to_seconds('1h06m') # 3960
TimeHumanizer.to_seconds('1h0m') # 3600
TimeHumanizer.to_seconds('') # nil
TimeHumanizer.to_seconds('  ') # nil
TimeHumanizer.to_seconds('x') # TimeHumanizer::InvalidArgument
TimeHumanizer.to_seconds('  x') # TimeHumanizer::InvalidArgument
TimeHumanizer.to_seconds('0f') # TimeHumanizer::InvalidArgument

TimeHumanizer.to_humanized_time(nil) # nil
TimeHumanizer.to_humanized_time(0) # '0'
TimeHumanizer.to_humanized_time(3600) # '1h'
TimeHumanizer.to_humanized_time(5400) # '1h30m'
TimeHumanizer.to_humanized_time(120) # '2m'
TimeHumanizer.to_humanized_time(3900) # '1h5m'
TimeHumanizer.to_humanized_time(3960) # '1h6m'
TimeHumanizer.to_humanized_time('0') # '0'
TimeHumanizer.to_humanized_time('3600') # '1h'
TimeHumanizer.to_humanized_time('5400') # '1h30m'
TimeHumanizer.to_humanized_time('120') # '2m'
TimeHumanizer.to_humanized_time('3900') # '1h5m'
TimeHumanizer.to_humanized_time('3960') # '1h6m'
TimeHumanizer.to_humanized_time('' # nil
TimeHumanizer.to_humanized_time('  ') # nil
TimeHumanizer.to_humanized_time('x') # TimeHumanizer::InvalidArgument
TimeHumanizer.to_humanized_time('  x') # TimeHumanizer::InvalidArgument
TimeHumanizer.to_humanized_time('0f') # TimeHumanizer::InvalidArgument
```

## Contributing

1. Fork it ( https://github.com/b-wojtowicz/time_humanizer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

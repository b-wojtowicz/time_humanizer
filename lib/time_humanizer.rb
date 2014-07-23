require "time_humanizer/version"

module TimeHumanizer
  class InvalidArgument < StandardError; end

  VALID_TIME = /
    ^
      (
        (?<hours> \d+?)h? |
        (?<minutes> \d+?)m |
        (?<hours> \d+?)h(?<minutes> \d+?)m
      )
    $
  /x

  VALID_SECONDS = /^\d+$/

  # Converts human readable time format like 1h30m to seconds
  def self.to_seconds(humanized_time_str)
    unless blank_value?(humanized_time_str)
      match_data = humanized_time_str.match VALID_TIME
      raise InvalidArgument unless match_data

      h, m = match_data[:hours], match_data[:minutes]
      (h.to_i * 3600) + (m.to_i * 60)
    end
  end

  # Converts seconds to human readable format like 1h30m
  def self.to_humanized_time(seconds)
    unless blank_value?(seconds)
      raise InvalidArgument if VALID_SECONDS !~ seconds.to_s

      seconds = seconds.to_i
      hours = seconds / 3600
      minutes = seconds % 3600 / 60

      str = (hours > 0) ? "#{hours}h" : ""
      str << "#{minutes}m" if minutes > 0
      str.size == 0 ? '0' : str
    end
  end

private

  def self.blank_value?(value)
    value.nil? ||
    (String === value && (
      value.empty? ||
      value.lstrip.empty?
    ))
  end
end

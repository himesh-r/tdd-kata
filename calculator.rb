class Calculator

  DEFAULT_DELIMITERS = ["\n", ',']
  CUSTOM_DELIMITER_PATTERN = /\/\/(.){0,1}\n/

  attr_accessor :input, :input_array_str, :input_numbers, :custom_delimiter

  def initialize(args)
    @input = args
    validate
    extract_custom_delimiter
  end

  def validate
    raise ArgumentError unless @input.is_a?(String)
  end

  def extract_custom_delimiter
    match = CUSTOM_DELIMITER_PATTERN.match(@input)
    @custom_delimiter = match[1] if match
  end

  def strip_custom_delimiter
    @input.gsub!(CUSTOM_DELIMITER_PATTERN, '')
  end

  def all_delimiters
    @custom_delimiter ? DEFAULT_DELIMITERS + [@custom_delimiter] : DEFAULT_DELIMITERS
  end

  def split_by_delimiter
    @input_array_str = @input.split(Regexp.union(all_delimiters))
  end

  def to_int
    @input_numbers = @input_array_str.map(&:to_i)
  end

  def sum
    strip_custom_delimiter
    split_by_delimiter
    to_int  
    @input_numbers.sum
  end

end
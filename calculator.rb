class Calculator

  DEFAULT_DELIMITERS = ["\n", ',']

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
    delimiter_pattern = /\/\/(.){0,1}\n/
    match = delimiter_pattern.match(@input)
    @custom_delimiter = match[1] if match
  end

  def all_delimiters
  end

  def split_by_delimiter
    @input_array_str = @input.split(Regexp.union(DEFAULT_DELIMITER))
  end

  def to_int
    @input_numbers = @input_array_str.map(&:to_i)
  end

  def sum
    @input_numbers.sum
  end

end
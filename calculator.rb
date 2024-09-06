class Calculator

  DEFAULT_DELIMITER = ["\n", ',']

  attr_accessor :input, :input_array_str, :input_numbers

  def initialize(args)
    @input = args
    validate
  end

  def validate
    raise ArgumentError unless @input.is_a?(String)
  end

  def extract_custom_delimiter
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
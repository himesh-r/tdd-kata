class Calculator

  DEFAULT_DELIMITER = ["\n", ',']

  attr_accessor :input

  def initialize(args)
    @input = args
    validate
  end

  def validate
    raise ArgumentError unless @input.is_a?(String)
  end

  def split_by_delimiter
    @input.split(Regexp.union(DEFAULT_DELIMITER))
  end

end
class Calculator

  attr_accessor :input

  def initialize(args)
    @input = args
    validate
  end

  def validate
    raise ArgumentError unless @input.is_a?(String)
  end

end
require '../calculator'

RSpec.describe Calculator do

  describe "calculator instance" do
    it "constructor takes one parameter and creates object of type calculator" do
      expect{Calculator.new}.to raise_error(ArgumentError)
      calculator = Calculator.new ""
      expect(calculator).to be_kind_of(Calculator)
    end

    it "should have attr_accessor for input" do
      calculator = Calculator.new ""
      expect(calculator).to respond_to(:input=)
      expect(calculator).to respond_to(:input)
    end

    it "should assign passed parameter to input" do
      calculator = Calculator.new "1,2"
      expect(calculator.input).to eq("1,2")
    end
  end

end
require '../calculator'

RSpec.describe Calculator do

  describe "constructor" do
    it "it takes one parameter and created object of type calculator" do
      expect{Calculator.new}.to raise_error(ArgumentError)
      calculator = Calculator.new ""
      expect(calculator).to be_kind_of(Calculator)
    end

  end

end
require '../calculator'

RSpec.describe Calculator do

  describe "calculator instance" do
    before do
      @calculator = Calculator.new ""
    end
    it "constructor takes one parameter and creates object of type calculator" do
      expect{Calculator.new}.to raise_error(ArgumentError)
      calculator = Calculator.new ""
      expect(calculator).to be_kind_of(Calculator)
    end

    it "should have attr_accessor for input" do
      expect(@calculator).to respond_to(:input=)
      expect(@calculator).to respond_to(:input)
    end

    it "should have attr_accessor for input_array_str" do
      expect(@calculator).to respond_to(:input_array_str=)
      expect(@calculator).to respond_to(:input_array_str)
    end

    it "should have to_int instance method" do
      expect(@calculator).to respond_to(:to_int)
    end

    it "should have split_by_delimiter instance method" do
      expect(@calculator).to respond_to(:split_by_delimiter)
    end

    it "should assign passed parameter to input" do
      calculator = Calculator.new "1,2"
      expect(calculator.input).to eq("1,2")
    end

    it "should have sum instance method" do
      expect(@calculator).to respond_to(:sum)
    end

    it "should have attr_accessor for input_numbers" do
      expect(@calculator).to respond_to(:input_numbers)
      expect(@calculator).to respond_to(:input_numbers=)
    end

    it "should have extract_custom_delimiter instance method" do
      expect(@calculator).to respond_to(:extract_custom_delimiter)
    end

    it "should have attr_accessor for custom_delimiter" do
      expect(@calculator).to respond_to(:custom_delimiter)
      expect(@calculator).to respond_to(:custom_delimiter=)
    end
    
  end

  describe "validator" do
    it "runs validations upon initialization" do
      allow_any_instance_of(Calculator).to receive(:validate)
      calculator = Calculator.new "1,2"
      expect(calculator).to have_received(:validate)
    end

    it "returns error if argument is not a string" do
      expect{Calculator.new 1}.to raise_error(ArgumentError)
    end
  end

  describe "delimiter" do
    it "has \\n and ',' as default delimiter" do
      expect(Calculator::DEFAULT_DELIMITER).to eq(["\n", ","])
    end

    describe "extract_custom_delimiter" do
      it "extracts custom delimiter from input string" do
        calculator = Calculator.new("//;\n1,2")
        expect(calculator.extract_custom_delimiter).to eq(";")
      end

      it "returns nil if custom delimiter is not passed" do 
        calculator = Calculator.new("1,2")
        expect(calculator.extract_custom_delimiter).to eq(nil)
      end

      it "should be called from constrcutor" do
        allow_any_instance_of(Calculator).to receive(:extract_custom_delimiter)
        calculator = Calculator.new("//;\n1,2")
        expect(calculator).to have_received(:extract_custom_delimiter)
      end
    end
  end

  describe "split_by_delimiter" do
    it "splits input string by allowed delimiter ','" do
      calculator = Calculator.new "1,2"
      expect(calculator.split_by_delimiter).to eq(["1", "2"])
    end

    it "splits input string by allowed delimiter '\n'" do
      calculator = Calculator.new "1\n2"
      expect(calculator.split_by_delimiter).to eq(["1", "2"])
    end

    it "splits input string by allowed delimiters '\n' and ','" do
      calculator = Calculator.new "1,2\n3"
      expect(calculator.split_by_delimiter).to eq(["1", "2", "3"])
    end

    it "assigns array of number strings to input_array_str" do
      calculator = Calculator.new "1,2"
      calculator.split_by_delimiter
      expect(calculator.input_array_str).to eq(["1", "2"])
    end
  end

  describe "to_int" do
    before do
      @calculator = Calculator.new "1,2"
    end

    it "converts input_array_str into array of numbers" do 
      @calculator.split_by_delimiter
      expect(@calculator.to_int).to eq([1,2])
    end

    it "assigns the converted array of numbers to input_numbers attr_accessor" do 
      @calculator.split_by_delimiter
      @calculator.to_int
      expect(@calculator.input_numbers).to eq([1,2])
    end
  end

  describe "sum" do
    it "returns addition of numbers present in input_array_str" do
      calculator = Calculator.new "1,2"
      calculator.split_by_delimiter
      calculator.to_int
      expect(calculator.sum).to eq(3)
    end
  end

end
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    context "when input is an empty string" do
      it "returns 0" do
        expect(calculator.add("")).to eq(0)
      end
    end

    context "when input contains a single number" do
      it "returns the number itself" do
        expect(calculator.add("5")).to eq(5)
      end
    end

    context "when input contains comma-separated numbers" do
      it "returns the sum of the numbers" do
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end

    context "when input contains newline-separated numbers" do
      it "returns the sum of the numbers" do
        expect(calculator.add("1\n2\n3\n4\n5")).to eq(15)
      end
    end

    context "when input contains a custom delimiter" do
      it "returns the sum of the numbers" do
        expect(calculator.add("//;\n1;2;3")).to eq(6)
      end
    end

    context "when input contains negative numbers" do
      it "raises an error" do
        expect { calculator.add("1,-2,3,-4,5") }.to raise_error("Negative numbers not allowed: -2, -4")
      end
    end

    context "when input contains numbers greater than 1000" do
      it "ignores numbers greater than 1000 and returns the sum" do
        expect(calculator.add("1001,2")).to eq(2)
      end
    end

    context "when input contains a custom delimiter of multiple characters" do
      it "returns the sum of the numbers" do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context "when input contains multiple delimiters" do
      it "returns the sum of the numbers" do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context "when input contains mixed delimiters and newlines" do
      it "returns the sum of the numbers" do
        expect(calculator.add("//[*]\n1*2,3\n4")).to eq(10)
      end
    end
  end
end

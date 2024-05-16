class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    end

    numbers = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negatives = numbers.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end
end

# Example Usage
calculator = StringCalculator.new

puts calculator.add("")      # Output: 0
puts calculator.add("1")      # Output: 1
puts calculator.add("1,5")     # Output: 6
puts calculator.add("1\n2,3")   # Output: 6
puts calculator.add("//;\n1;2")  # Output: 3
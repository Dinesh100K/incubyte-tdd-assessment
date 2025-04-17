class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers = numbers.gsub("\n", ',')
    numbers_array = numbers.split(',').map(&:to_i)
    numbers_array.sum
  end
end

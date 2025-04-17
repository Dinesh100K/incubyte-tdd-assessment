class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers_array = numbers.split(',').map(&:to_i)
    numbers_array.sum
  end
end

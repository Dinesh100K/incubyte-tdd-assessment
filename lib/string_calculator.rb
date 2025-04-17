class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
   
    delimiters = determine_delimiters(numbers)
    num_str = extract_numbers_string(numbers)

    nums = num_str.split(delimiters).map(&:to_i)
    check_for_negatives(nums)

    nums.sum
  end

  private

  def determine_delimiters(numbers)
    if numbers.start_with?('//')
      delimiter_spec, = numbers.split("\n", 2)
      custom = delimiter_spec[2..]
      Regexp.new("[#{Regexp.escape(custom)}\n]")
    else
      /,|\n/
    end
  end

  def extract_numbers_string(numbers)
    if numbers.start_with?('//')
      numbers.split("\n", 2).last
    else
      numbers
    end
  end

  def check_for_negatives(nums)
    negatives = nums.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
